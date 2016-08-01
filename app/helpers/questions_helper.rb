module QuestionsHelper
	require 'numbers_in_words'

	def number_to_word(number)
		return NumbersInWords.in_words(number)
	end

	def word_to_number(word)
		return NumbersInWords.in_numbers(word)
	end

	def is_correct(original_ans, user_ans)
		if user_ans.downcase == "zero"
			return true
		elsif user_ans == "0"
			return true
		elsif original_ans.downcase == user_ans.downcase 
			return true
		elsif original_ans == NumbersInWords.in_words(user_ans.to_i)
			return true
		elsif original_ans == NumbersInWords.in_numbers(user_ans)
			return true
		else
			return false
		end
	end

	def add_score(questions, category_id)
		Score.create(correct_points: get_scores(questions)[:correct_score], wrong_points: get_scores(questions)[:wrong_score], category_id: category_id, user_id: current_user.id)
	end

	def save_session_answer(question_id, pass_value, user_answer)
		session[:result].push({ question_id: question_id , is_passed: pass_value, answer: params[:answer]})
	end

	def get_scores(questions)
		answers = questions.map{|q| q[:is_passed]}
		scores = {correct_score: answers.count(true), wrong_score: answers.count(false)}
		return scores
	end

	def next_directory
		if session[:question_id].present?
			redirect_to question_random_path(session[:question_id].sample)
		else
			redirect_to question_results_page_path()
		end
	end

end