class User < ActiveRecord::Base
	#associations
	has_many	:cards
	has_many	:user_cards, :through => :user_cards

	#validations
	validates :email, uniqueness: true
	validates_presence_of :fname, on: :create
	validates :lname, presence: true
	validates_numericality_of :cash_bal, greater_than: 0, on: :create
	validates_format_of :phone, :with => /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/




	# Ctype = ['Visa', 'Mastercard', 'Amex']

	# def ctype_print
	# 	Ctype[self.ctype]
	# end
#some_number = SomeModel.first.price number_to_currency(some_number, unit: "$")

end


# -- from Day26 user.rb

# class User < ActiveRecord::Base
# 	validates_presence_of	:email
# 	before_save	:some_method
# 	after_save	:create_name
# 	STATUS = ['active', "inactive", "banned"]

# 	def status_print
# 		STATUS[self.status]
# 	end
# -create a column in database to store a drop down number value
# -put values in an array (above STATUS) to recall value on number



# 	def create_name
# 		if self.username.empty?
# 			puts "name is blank for now"
# 		else
# 			puts self.names


# 		end
# 	end






# 	def some_method
# 		puts "I'll run before record is saved"	
# 	else
# 		puts "User has put some text"
# 	end


# - add week 6 day 1. ActiveRecord Callbacks def som-method shows in terminal
# -created show.html.erb to show the users (in the users_path)
# -in browser its should be users/5 will show user number 5
