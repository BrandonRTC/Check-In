class Tour < ActiveRecord::Base

	belongs_to :house
	has_many :check_ins

	has_attached_file :start_img, 
		styles: {small: "200x200#"},
		s3_protocol: "https",
		url: ":s3_domain_url",
		path: "/:class/:attachment/:id_partition/:style/:filename"

	has_attached_file :end_img,
		styles: {small: "200x200#"},
		s3_protocol: "https",
		url: ":s3_domain_url",
		path: "/:class/:attachment/:id_partition/:style/:filename"

	validates :house_id, presence: true
	#validates :timeslot, numericality: {only_integer: true, less_than: 4, greater_than_or_equal_to: 0}

	validates :start_img_fingerprint, uniqueness: {message: "Image must be unique!"}
	validates :end_img_fingerprint, uniqueness: {message: "Image must be unique!"}, allow_nil: true

	validates_attachment :start_img, presence: true, content_type: { content_type: ["image/png", "image/jpeg"]}
	validates_attachment :end_img, content_type: { content_type: ["image/png", "image/jpeg"]}

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
