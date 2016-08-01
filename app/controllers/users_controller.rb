class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to questions_path
		else
			redirect_to '/login'
		end
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin)
		end
end