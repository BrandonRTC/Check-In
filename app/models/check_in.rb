class CheckIn < ActiveRecord::Base

	belongs_to :room
	belongs_to :tour
	has_one :house, through: :tour, source: :house

	validates :status, presence: true
	validates :tour_id, presence: true
	validates :room_id, presence: true

	# validate :validate_house
	# validate :validate_new_room

	private
	# def validate_house
	# 	check = self
	# 	unless self.house.rooms.find_index {|r| r.id == check.room_id}
	# 		errors.add(:room_id, "Room must be in your building!")
	# 	end
	# end
end