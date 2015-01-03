class Tour < ActiveRecord::Base

	#validations!

	#associations!
	belongs_to :house
	has_many :rooms
	has_many :check_ins, through: :rooms, source: :check_ins

	#functions!

end
