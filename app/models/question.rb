class Question < ActiveRecord::Base
	include Bootsy::Container
	
	belongs_to :category
end
