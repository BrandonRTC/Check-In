class SessionsController < ApplicationController

	before_action :require_sign_in!, only: [:destroy]

	def new
		redirect_to user_url(current_user) if signed_in? 
		@user = User.new
	end

	def create
		#maybe make user an instance variable for view?
		@user = User.find_by_credentials(
			params[:user][:username],
			params[:user][:password]
		)

		if @user.nil?
			flash.now[:errors] = "Invalid username or password"
			render :new
		else
			login!(@user)
			if @user.superuser
				redirect_to houses_url
			else
				redirect_to user_url(@user)
			end
		end
	end

	def destroy
		logout!
		redirect_to new_session_url
	end

end