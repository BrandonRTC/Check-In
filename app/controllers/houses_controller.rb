class HousesController < ApplicationController

	before_action :require_sign_in!

	# for monitoring in progress tours
	def index		
		time = get_shift_start
		@houses = House.all
		@tours = Tour.where(created_at: time..Time.now)
		
		render :backbone_new
	end

end