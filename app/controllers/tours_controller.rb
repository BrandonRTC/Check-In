class ToursController < ApplicationController

	before_action :require_sign_in!

	def index
		@tours = Tour.order(id: :desc).page(params[:page]).per(10)
	end

	def new 
		@houses = House.all
		# @timeslots = get_tour_time_slots
	end

	def create
		@tour = Tour.new(new_tour_params)
		if @tour.save
			redirect_to new_tour_check_in_url(@tour)
		else
			flash.now[:errors] = @tour.errors.full_messages
			@houses = House.all
			# @timeslots = get_tour_time_slots
			render :new
		end
	end

	def edit
		@tour = Tour.find(params[:id])
	end

	def update
		@tour = Tour.find(params[:id])
		@tour.completed = true
		
		if @tour.update(edit_tour_params)
			redirect_to user_url(current_user.id)
		else
			flash.now[:errors] = @tour.errors.full_messages
			render :edit
		end
	end

	private

	def new_tour_params
		params.require(:tour).permit(:house_id, :start_img)#, :timeslot)
	end

	def edit_tour_params
		params.require(:tour).permit(:end_img)
	end
end