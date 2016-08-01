require "spec_helper"

describe QuestionsController do
	describe :questions do
		it { should_not be_empty}
	end

	describe :question do 
		it { should_not be_empty}
	end

	describe	'DELETE#destroy' do 
		context "success" do
			it "deletes the question" do 
				expect {
					delete :destroy, id: @question
				}
			end
		end
	end
end