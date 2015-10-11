class HousesController < ApplicationController

	before_action :require_sign_in!

	# for monitoring in progress tours
	def index		
		# for production
		time = get_shift_start

		# for development
		# time = Time.now.change({hour: 12})

		# for regular log view
		# @houses = House.all.includes(:tours).where({created_at: time..Time.now})
		
		@houses = House.includes(:tours)
									 .where("tours.created_at BETWEEN ? AND ?", time, Time.now)
									 .references(:tours)

		render :index

		# for backbone view
		# @houses = House.all
		# @tours = Tour.where(created_at: time..Time.now)
		# render :backbone_new
	end

end