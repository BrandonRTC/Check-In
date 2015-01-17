class CheckIn < ActiveRecord::Base

	belongs_to :room
	belongs_to :tour

	validates :status, presence: true
	validates :tour_id, presence: true
	validates :room_id, presence: true

	#write custom validation to ensure that room_id points to a valid room in the current_user's/tour's house

end
