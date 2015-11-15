class CardsController < ApplicationController

	def current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end

	def current_card
		if session[:user_id]
			@current_card = Card.find_by_id(session[:user_id])
		end
	end

	def index
		@user = current_user
		@card = Card.find_by_id(params[:user_id])
	end	

	def new		
		#user_info = params[:user]
		#ulname = user_info[:lname]
		@user = current_user
		session[:id] = @user.id
		@card = Card.new
	end

	def create
		@card = Card.new
		@user = current_user
		session[:id] = @user.id






	# #observe output and change param input	
	# 	cardinfo = card_params
	# 	dateinfo = date_params
	# 	cardinfo[:expire_m] = date_params[:month]
	# 	cardinfo[:expire_y] = date_params[:year]
	# 	puts "YYYYYYYYYYY"
	# 	puts cardinfo[:expire_m]
	# 	card_params = cardinfo
	# 	puts "XXXXXXXXXXXX"
	# 	puts card_params
	# 	#binding.pry
	 	if @card.save(card_params)
			redirect_to card_path
		else
			flash[:error] = @card.errors.full_messages.to_sentence
			render :new
		end	
	end

	def edit
		@user = current_user
		@card = @current_card
	end


	def card_params
		params.require(:card).permit(:cardnum, :cardtype, :expire_m, :expire_y)
	end

	def date_params
		params.require(:date).permit(:month, :year)
	end
end

