class Tour < ActiveRecord::Base

	belongs_to :house
	has_many :check_ins

	has_attached_file :start_img, styles: {}
	has_attached_file :end_img, styles: {}

	validates :house_id, presence: true
	validates_attachment_content_type :start_img, content_type: /\Aimage\/.*\Z/
	validates_attachment_content_type :end_img, content_type: /\Aimage\/.*\Z/

end
