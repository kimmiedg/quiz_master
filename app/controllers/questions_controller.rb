class QuestionsController < ApplicationController
	before_filter :authorize
	before_action :set_question, only: [:edit, :destroy]
	include QuestionsHelper

	def index
		@questions = Question.where(category_id: params[:category_id])
		session[:question_id] = @questions.all.pluck(:id)
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)
		if @question.save
			redirect_to questions_path(category_id: @question.category_id)
		else
			flash[:alert] = "Did not saved"
		end
	end

	def put_answer
		@question = Question.find(params[:question_id])
		if is_correct(@question.answer, params[:answer])
			save_session_answer(@question.id, true, answer: params[:answer])
			next_directory
		else
			save_session_answer(@question.id, false, answer: params[:answer])
			next_directory
		end
	end

	def results_page
		@questions.present? ? @questions.clear : @questions = []
		session[:result].each do |result|
			@questions << { question: find_question(result["question_id"]), is_passed: result["is_passed"], answer: result["answer"]}
		end	
		add_score(@questions, @questions.first[:question].category_id)
		session[:result] = []
	end

	def random
		@question = Question.find(params[:question_id])
		if session[:question_id].count == 1
			session[:question_id] = nil
		else
			session[:question_id].delete(params[:question_id].to_i)
		end	
	end

	def edit
	end

	def destroy
		if @question.destroy
			redirect_to questions_path(category_id: @question.category_id)
		else
			flash[:alert] = "Category not saved"
			redirect_to questions_path(category_id: @question.category_id)
		end
	end

	def update
	end

	private

		def find_question(id)
			question = Question.find(id)
		end

		def set_question
			@question = Question.find(params[:id])	
		end

		def question_params
			params.require(:question).permit(:title, :answer, :category_id, :bootsy_image_gallery_id)
		end
end