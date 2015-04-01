class HousesController < ApplicationController

	before_action :require_sign_in!

	# for monitoring tours
	def index
		# query for production; ask John about the actual tour times
		# time = Time.now.change({hour: 19})

		# queries for testing
		time = Time.new(2015, 2, 20, 12)
		@houses = House.includes(:tours).where(tours: {created_at: time..(time + 12.hours)})
	end

end
