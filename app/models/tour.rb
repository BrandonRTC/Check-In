class Tour < ActiveRecord::Base

	belongs_to :house
	has_many :check_ins
	# has_many :check_ins, through: :rooms, source: :check_ins
	# has_many :rooms

end
