class SessionsController < ApplicationController
	
	def create
		@user = User.find_by_email(params[:email])	
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to categories_path
		else
			redirect_to '/signup'
		end
	end

	def destroy
		session[:user_id] = nil
		session[:question_id] = nil
		redirect_to '/login'
	end
	
end