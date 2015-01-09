class CheckInsController < ApplicationController

	def new
		@check_in = CheckIn.new
	end

	def create
		#nest new check_ins under tours to keep tour_id in url params
		tour = Tour.find_by(params[:tour_id])
		@check_in = tour.new(check_in_params)
	end

	def index
		@check_ins = CheckIn.all
	end

	private

	def check_in_params
		#find a way to account for the room_id
		params.require(:check_in).permit(:status, :initials, :comment)
	end

end
