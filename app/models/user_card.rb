class UserCard < ActiveRecord::Base

	#associations
	belongs_to :card
	belongs_to :user

end
