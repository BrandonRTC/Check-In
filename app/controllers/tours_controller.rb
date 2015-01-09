class ToursController < ApplicationController

	def new 
		@tour = Tour.new
	end

	def create
		#create tour based on house associated with current_user here
		#might need a special work around for this for administrators, who don't have one associated house
		@tour = current_user.house.tours.new(tour_params)

		if @tour.save
			redirect_to new_check_in_url
		else
			flash.now[:errors] = @tour.errors.full_messages
			render :new
		end
	end

	def edit
		@tour = Tour.find_by(params[:id])
	end

	def update
		if @tour.update(tour_params)
			redirect_to user_url(current_user.id)
		else
			#FILL THIS IN
		end
	end

	private

	def tour_params
		# params.require(:tours).permit(:house, :in_selfie, :out_selfie)
		# since selfies are taken at different times, should there only be one selfie param or two for both data fields?
	end

end
