class CheckIn < ActiveRecord::Base

	belongs_to :room
	belongs_to :tour

end
