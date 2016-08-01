class ScoresController < ApplicationController

	def index
		@scores = Score.where(user_id: params[:user_id])
	end
	
end