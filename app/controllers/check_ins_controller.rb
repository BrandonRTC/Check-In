class CheckInsController < ApplicationController

	def new
		@tour = Tour.find(params[:tour_id])
		@rooms = @tour.house.rooms.reverse

		# might need to use jbuilder for fiddling with json params sent over
		# render json: {tour: @tour, rooms: @rooms}
		render :new_page_root
	end

	def create
		@tour = Tour.find(params[:tour_id])
		# room param might change with QR code
		# @room = Room.find(check_in_params[:check_in].first[:room_id])
		@check_ins = @tour.check_ins.create(check_in_params[:check_in]).reject {|c| c.errors.empty?}

		if @check_ins.empty?
			if @tour.end_of_tour?
				redirect_to edit_tour_url(@tour.id)
			else
				render :new
			end
		else
			flash.now[:errors] = @check_ins.errors.full_messages
			render :new
		end

	end

	def index
		@check_ins = CheckIn.all
	end

	private

	def check_in_params
		# params.require(:check_in).permit(:status, :initials, :comment, :room_id)
		params.require(:room).permit(:check_in => [:status, :initials, :comment, :room_id])
	end

end

# params visualizations

# params.require(:list).permit(:0, :1, :2, :check_in, :status, :initials, :comment, :room_id)

# list => {

# 	0 => check_in => {status => A, initials => CMM, comment => blah blah, room_id => 4},
# 	1 => check_in => {...}
# 	2 => check_in => {...}

# }

# ------------------------------

# params.require(:check_in).permit(?)

# check_in {

# 	0 => {status,init,etc},
# 	1 => {...},
# 	2 => {...},
# 	...

# }

# check_in.to_a 

# -------------------------------

# params.require(:room).permit({:check_ins => [:status, :initials, :comment, :room_id]})

# room => {
# 	check_ins => [
# 		{:status, :initials, :comment, :room_id},
# 		{:status, :initials, :comment, :room_id},
# 		{:status, :initials, :comment, :room_id}
# 	]
# }

# room => {
# 	check_ins => [
# 		{:status, :initials, :comment, :room_id},
# 		{:status, :initials, :comment, :room_id},
# 		{:status, :initials, :comment, :room_id}
# 	]
# }