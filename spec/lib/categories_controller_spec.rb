require "spec_helper"

describe CategoriesController do
	describe :categories do
		it { should_not be_empty}
	end

	describe :category do 
		it { should_not be_empty}
	end

	describe	'DELETE#destroy' do 
		context "success" do
			it "deletes the category" do 
				expect {
					delete :destroy, id: @category
				}
			end
		end
	end
end