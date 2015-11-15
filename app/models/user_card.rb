class UserCard < ActiveRecord::Base
	has_many	:users
	has_many	:cards, through class_name => :user
end
