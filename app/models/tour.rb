class Tour < ActiveRecord::Base

	belongs_to :house
	has_many :check_ins

	has_attached_file :start_img, styles: {
		small: "200x200#"
	}
	has_attached_file :end_img, styles: {
		small: "200x200#"
	}

	validates :house_id, presence: true
	validates :start_img, presence: true

	validates_attachment_content_type :start_img, content_type: /\Aimage\/.*\Z/
	validates_attachment_content_type :end_img, content_type: /\Aimage\/.*\Z/

	# need to find robust way of enforcing that a room is not checked twice!
	def end_of_tour?
		self.check_ins.count == self.expected_check_ins
	end
	
	def expected_check_ins
		checks =  0
		self.house.rooms.each do |r|
			checks += r.num_beds
		end
		checks
	end

	# def validate_new_room(room_id)
	# 	if self.check_ins.find_index { |el| el.room_id == room_id }
	# 		false
	# 	else
	# 		true
	# 	end
	# end
	
end
