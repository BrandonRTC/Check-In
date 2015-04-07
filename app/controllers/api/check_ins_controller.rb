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

		if @tour.validate_new_room(params[:check_in][:room_id])

			@check_ins = @tour.check_ins.create(new_check_in_params[:check_in]).reject {|c| c.errors.empty?}

			if @check_ins.empty?
				if @tour.end_of_tour?
					render json: {redirect: edit_tour_url(@tour.id)}
				else
					render json: :success
				end
			else
				render json: "error message!"
				# render error messages for what? (since @check_ins is an array), just status unprocessable_entity?
				# also, double check that this was done properly for backbone
			end
		else
			render json: 
		end
	end

	private

	def new_check_in_params
		params.require(:room).permit(:check_in => [:status, :initials, :comment, :room_id])
	end

end