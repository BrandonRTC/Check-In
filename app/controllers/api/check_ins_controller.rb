class Api::CheckInsController < ApplicationController

	#might want to require sign in here? (and at every controller)

	#figure out jbuilder and use it on new and create methods

	def new
		@tour = Tour.find(params[:tour_id])
		@rooms = @tour.house.rooms.reverse
		@check_in = CheckIn.new

		render json: {tour: @tour, rooms: @rooms, check_in: @check_in}
	end

	def create
		# use a TRANSACTION to create the array of check_ins (probably going to user browser validations too)
		# pass in array to make however many check_in objects necessary

		@tour = Tour.find(params[:tour_id])
		@room = Room.find(check_in_params[:room_id])
		@check_in = @tour.check_ins.new(check_in_params)

		#for API, switch :new to :json @check_in

		if @check_in.save
			if @tour.end_of_tour?
				redirect_to edit_tour_url(@tour.id)
			else
				render :new
			end
		else
			flash.now[:errors] = @check_in.errors.full_messages
			render :new
		end
	end

	def index
		@check_ins = CheckIn.all
	end

	private

	def check_in_params
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
