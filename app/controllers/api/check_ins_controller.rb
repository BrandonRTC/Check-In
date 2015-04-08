class Api::CheckInsController < ApplicationController

	def create
		@tour = Tour.find(params[:tour_id])
		@check_ins = @tour.check_ins.create(new_check_in_params[:check_in]).reject {|c| c.errors.empty?}

		if @check_ins.empty?
			if @tour.end_of_tour?
				render json: {redirect: edit_tour_url(@tour.id)}
			else
				render json: :success
			end
		else
			render json: @check_ins.first.errors.full_messages, status: :unprocessable_entity
			#come back to this for a better solution (how to display array of models' errors?)
		end
	end

	private

	def new_check_in_params
		params.require(:room).permit(:check_in => [:status, :initials, :comment, :room_id])
	end

end