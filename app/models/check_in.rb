class CheckIn < ActiveRecord::Base

	belongs_to :room
	belongs_to :tour

	#add validations for attributes

end
