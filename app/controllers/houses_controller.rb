class HousesController < ApplicationController

	def index
		@houses = House.all
		#add some json or instance variables to store tour data
	end

end
