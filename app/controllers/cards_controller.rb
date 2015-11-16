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
		@user = current_user
		session[:id] = @user.id
		@card = Card.new
	end

	def create
		@card = Card.new
		@user = current_user
		session[:id] = @user.id
	 #observe output and change param input	
	# 	cardinfo = card_params
	 	puts "AAAAAAAAAAAAA"
	 	puts card_params
	 	puts "BbBBBBBBBBBB"
	 	c_cardnum = card_params[:cardnum]
	 	puts c_cardnum
	# 	binding.pry
	# 	card_params = cardinfo
	# 	puts "XXXXXXXXXXXX"
	# 	puts card_params
	# 	#binding.pry
	 	if @card.save(card_params)
			redirect_to card_path(@user.id)
		else
			flash[:error] = @card.errors.full_messages.to_sentence
			render :new
		end	
	end

# @post = Post.create(post_params)
# 		flash[:notice] = "Your post is saved."
# 		@user.posts << @post

  
# def create
# 	user_info = params[:user]
# 	username = user_info[:username]
# 	pass = user_info[:password]
# 	@user = User.where(username: username).first
# 	if @user == nil
# 		flash[:alert] = "Not on list. Please sign up."
# 		redirect_to new_user_path
# 	elsif @user.password != pass
# 		flash[:alert] = "Username/Password mismatch. Please try again."
# 	    redirect_to login_path
# 	else
# 		session[:user_id] = @user.id
# 		redirect_to users_path
# 		return
# 	end
# end






	def edit
		@user = current_user
		@card = @current_card
	end

	def show
		@card = @current_card
		@user = User.find(params[:id])
	end




	def card_params
		params.require(:card).permit(:cardnum, :cardtype, :expire_m, :expire_y)
	end

	def date_params
		params.require(:date).permit(:month, :year)
	end
end

