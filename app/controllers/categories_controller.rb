class CategoriesController < ApplicationController
	before_filter :authorize
	before_action :set_category, only: [:edit, :update, :destroy]

	def index
		@categories = Category.all	
	end

	def new
		@category = Category.new
	end

	def edit
	end

	def update
		if @category.update(category_params)
			redirect_to categories_path
		else
			flash[:alert] = "Category was not successfully updated"
		end
	end

	def destroy
		if @category.destroy
			redirect_to categories_path
		else
			flash[:alert] = "Category was not deleted."
		end
	end

	def create
		@category = Category.new(category_params)
	
		if @category.save
			redirect_to categories_path()
		else
			flash[:alert] = "Category did not save."
		end
	end

	private
		def set_category
			@category = Category.find(params[:id])
		end

		def category_params
			params.require(:category).permit(:name)
		end
end