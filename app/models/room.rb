class Room < ActiveRecord::Base

	#validations!

	#associations!
	belongs_to :tour
	has_many :check_ins

	#functions!

end
