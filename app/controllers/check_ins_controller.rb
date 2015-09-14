class CheckInsController < ApplicationController

	before_action :require_sign_in!

	def new
		@tour = Tour.find(params[:tour_id])
		@rooms = @tour.house.rooms.reverse
		@rooms_visited = @tour.check_ins.map {|c| c.room_id.to_s}.uniq

		render :backbone_new
	end

	# def create
	# 	@tour = Tour.find(params[:tour_id])
	# 	# room param might change with QR code
	# 	# @room = Room.find(check_in_params[:check_in].first[:room_id])
	# 	@check_ins = @tour.check_ins.create(new_check_in_params[:check_in]).reject {|c| c.errors.empty?}
	# 	if @check_ins.empty?
	# 		if @tour.end_of_tour?
	# 			redirect_to edit_tour_url(@tour.id)
	# 		else
	# 			render :new
	# 		end
	# 	else
	# 		flash.now[:errors] = @check_ins.errors.full_messages
	# 		render :new
	# 	end
	# end

	def index
		@houses = House.all
		@check_ins = CheckIn.order(:tour_id).order(:created_at).page(params[:page])
	end

	def report
		start_date = Date.parse(report_params[:start])
		end_date = Date.parse(report_params[:end])

		if end_date < start_date
			new_start = end_date
			end_date = start_date
			start_date = new_start
		end

		@check_ins = House.find(report_params[:house])
											.check_ins
											.where(created_at: start_date..end_date + 1.day)
																					
		send_data @check_ins.to_csv
		# render text: @check_ins.to_csv
	end

	private

	def new_check_in_params
		params.require(:room).permit(:check_in => [:status, :initials, :comment, :room_id])
	end

	def report_params
		params.require(:report).permit(:house, :start, :end)
	end
end