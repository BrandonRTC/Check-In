class ToursController < ApplicationController

	def index
		@tours = Tour.where#date == current day

		#render json here for dynamic page
	end

	def new 
		@tour = Tour.new
	end

	def create
		@tour = Tour.new(new_tour_params)

		if @tour.save
			# redirect_to new_tour_check_in_url(@tour)
			redirect_to edit_tour_url(@tour)
		else
			flash.now[:errors] = @tour.errors.full_messages
			render :new
		end
	end

	def edit
		@tour = Tour.find_by(params[:id])
	end

	def update
		@tour = Tour.find_by(params[:id])

		if @tour.update(edit_tour_params)
			redirect_to user_url(current_user.id)
		else
			flash.now[:errors] = @tour.errors.full_messages
			render :edit
		end
	end

	private

	def new_tour_params
		params.require(:tour).permit(:house_id, :start_img)
	end

	def edit_tour_params
		params.require(:tour).permit(:end_img)
	end
end
