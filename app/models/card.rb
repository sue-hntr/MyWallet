class Card < ActiveRecord::Base

	#associations
	belongs_to	:user
	has_many	:user_cards, through: :user_cards

	#validations
#	validates :cardnum, numericality: true, presence: true, uniqueness: true
  	validates_inclusion_of :expire_m, in: 1..12
  	validates :expire_y, numericality: {greater_than_or_equal_to: Time.now.year}

	#callbacks
	before_save :whatcard

	#methods
	def whatcard
		card_num = card_params[:cardnum]

		if card_num.start_with?("4")
			cardinfo.cardtype = "Visa"
		# elseif self.cardnum.start_with?("51", "52", "53", "54", "55")
		# 	self.cardtype = 'MasterCard'
		# elseif self.cardnum.start_with?('6011', '65')
		# 	self.cardtype = 'Discover'
		else card_num.start_with?('34', '37')
			cardinfo.cardtype = 'American Express'
		end  
	end

end
###################################
	# validates :cardnum, length: { is: 16 }

#validates_inclusion_of :age, in: 0..99


# <%= f.label :ExpirationYear %>
# <%= f.text_field :expire_y %>


# <br>
# <br>
# <%= f.label :CardType %>
# <%= f.text_field :cardtype %>





# puts 'abcdefg'.start_with?('abc')  #=> true
# [edit] This is something I didn't know before this question: start_with takes multiple arguments.

# 'abcdefg'.start_with?( 'xyz', 'opq', 'ab')		




#keep for notes for later
# class Physician < ActiveRecord::Base
#   has_many :appointments
#   has_many :patients, through: :appointments
# end

# class Appointment < ActiveRecord::Base
#   belongs_to :physician
#   belongs_to :patient
# end

# class Patient < ActiveRecord::Base
#   has_many :appointments
#   has_many :physicians, through: :appointments
# end

