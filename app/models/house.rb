class House < ActiveRecord::Base

	has_many :tours
	has_many :rooms, through: :tours, source: :rooms
	# has_many :check_ins, through: :rooms, source: :check_ins

end