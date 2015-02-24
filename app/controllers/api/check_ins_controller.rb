class Api::CheckInsController < ApplicationController

	#might want to require sign in here? (and at every controller)
	#figure out jbuilder and use it on new and create methods

	# def new
	# 	@tour = Tour.find(params[:tour_id])
	# 	@rooms = @tour.house.rooms.reverse

	# 	# might need to use jbuilder
	# 	render json: {tour: @tour, rooms: @rooms}
	# end

	def create
		@tour = Tour.find(params[:tour_id])
		# @room = Room.find(check_in_params[:room_id])
		# @check_in = @tour.check_ins.new(check_in_params)
		@check_ins = @tour.check_ins.create(check_in_params[:check_in]).reject {|c| c.errors.empty?}

		if @check_ins.empty?
			if @tour.end_of_tour?
				render json: {redirect: edit_tour_url(@tour.id)}
			else
				# need to figure out what should actually be sent back/if below is even valid
				render json: :success
			end
		else
			#CHECK HOW TO DO THIS PROPERLY
			render json: :errors
			# render error messages for what? (since @check_ins is an array), just status unprocessable_entity?
		end
	end

	def index
		@check_ins = CheckIn.all
	end

	private

	def check_in_params
		params.require(:room).permit(:check_in => [:status, :initials, :comment, :room_id])
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
