class AddTimeSlotToTours < ActiveRecord::Migration
  def change
  	add_column :tours, :timeslot, :integer
  end
end
