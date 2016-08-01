class Category < ActiveRecord::Base
	has_many :questions, dependent: :destroy
	has_many :scores
end
