class UsersController < ApplicationController

	before_action :require_current_user!, except: [:create, :new]
	before_action :require_correct_user!, except: [:create, :new]

	def new 
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		#might not want to render json just yet, check other app
		if @user.save
			login!(@user)
			redirect_to user_url(@user)
		else
			render json: @user.errors.full_messages
		end

	end

	def show
		#load up instance variables for tours, etc.
		#double check this to make sure it works properly
		@user = User.find(current_user.id) #can also use params[:id]
		render :show
	end

	private

	def user_params
		params.require(:user).permit(:username, :password)
	end

	def require_correct_user!
		user = User.find_by_id(params[:id])
		if current_user.session_token != user.session_token
			redirect_to user_url(current_user.id)
		end
	end

end
