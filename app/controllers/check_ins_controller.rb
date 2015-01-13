class CheckInsController < ApplicationController

	def new
		@check_in = CheckIn.new
	end

	def create
		#use TRANSACTION to create the array of check_ins (probably going to user browser validations too)

		#nest new check_ins under tours to keep tour_id in url params
		tour = Tour.find_by(params[:tour_id])
		
		#pass in array to make however many check_in objects necessary

		@check_in = tour.new(check_in_params)#THIS IS WRONG/OBSOLETE

		#function adds beds of rooms against number of check_ins under current tour
		#if equal, return to user SHOW, else render NEW check_in

	end

	def index
		@check_ins = CheckIn.all
	end

	private

	def check_in_params
		#find a way to account for the room_id

		#check how whitelisting works with hacked 'array' params

		params.require(:check_in).permit(:status, :initials, :comment, :room_id)
	end

end

# params visualizations

# list => {

# 	0 => check_in => {status => A, initials => CMM, comment => blah blah, room_id => 4},
# 	1 => check_in => {...}
# 	2 => check_in => {...}

# }

# check_in {

# 	0 => {status,init,etc},
# 	1 => {...},
# 	2 => {...},
# 	...

# }

# check_in.to_a 
