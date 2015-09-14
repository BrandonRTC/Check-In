class RemoveTimeslotFromTours < ActiveRecord::Migration
  def change
    remove_column :tours, :timeslot, :integer
  end
end
