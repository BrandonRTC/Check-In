class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
    	t.string :name, null: false
    	t.integer :tour_id, null: false
    	t.integer :num_beds, null: false

      t.timestamps
    end
    add_index :rooms, :tour_id
  end
end
