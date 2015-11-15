class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def user_params
		params.require(:user).permit(:fname, :lname, :email, :phone, :cash_bal, :id)
	end
end
