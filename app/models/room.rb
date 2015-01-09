class Room < ActiveRecord::Base

	# belongs_to :tour
	belongs_to :house
	has_many :check_ins

end
