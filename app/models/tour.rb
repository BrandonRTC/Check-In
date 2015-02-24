class Tour < ActiveRecord::Base

	belongs_to :house
	has_many :check_ins

	has_attached_file :start_img, styles: {}
	has_attached_file :end_img, styles: {}

	validates :house_id, presence: true
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
	
end
