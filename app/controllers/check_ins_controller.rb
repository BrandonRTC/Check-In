class CheckInsController < ApplicationController

	def new
		@tour = Tour.find(params[:tour_id])
		@check_in = CheckIn.new
	end

	def create
		tour = Tour.find(params[:tour_id])
		room = Room.find(check_in_params[:room_id])
		#OLD/TEMPORARY => function adds beds of rooms against number of check_ins under current tour
		#if equal, return to user SHOW, else render NEW check_in

		@check_in = tour.check_ins.new(check_in_params)

		if @check_in.save
			redirect_to edit_tour_url(tour.id)
		else
			flash.now[:errors] = @check_in.errors.full_messages
			render :new
		end

		
		#NEW/BETTER => use a TRANSACTION to create the array of check_ins (probably going to user browser validations too)
		#pass in array to make however many check_in objects necessary

	end

	def index
		@check_ins = CheckIn.all
	end

	private

	def check_in_params
		#find a way to account for the room_id => hidden input
		#use backbone, jquery, ajax, QR, etc to get right number of check-in 'bundle' form fields

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
