class HousesController < ApplicationController

	before_action :require_sign_in!

	# for monitoring in progress tours
	def index		
		if Time.now.hour >= 18
			time = Time.now.change({hour: 18})
		elsif Time.now.hour <= 17
			time = Time.now.change({hour: 18, day: Time.now.day - 1})
		end

		# time = Time.now.change({hour: 23})
		@houses = House.includes(:tours).where(tours: {created_at: time..(time + 9.hours)})
	end

end