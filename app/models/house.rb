class House < ActiveRecord::Base

	has_many :permissions
	has_many :users, through: :permissions, source: :user
	has_many :tours
	has_many :rooms
	has_many :check_ins, through: :tours, source: :check_ins
	
end