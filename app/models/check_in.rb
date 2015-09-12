class CheckIn < ActiveRecord::Base

	belongs_to :room
	belongs_to :tour
	has_one :house, through: :tour, source: :house

	validates :status, presence: true
	validates :tour_id, presence: true
	validates :room_id, presence: true

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |check_in|
				csv << check_in.attributes.values_at(*column_names)
			end
		end
	end

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