class HousesController < ApplicationController

	before_action :require_sign_in!

	# for monitoring tours
	def index
		# change 12 back to 23
		time = Time.now.change({hour: 23})
		@houses = House.includes(:tours).where(tours: {created_at: time..(time + 9.hours)})
	end

end
