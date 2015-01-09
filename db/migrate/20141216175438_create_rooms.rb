class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
    	t.string :name, null: false
    	t.integer :house_id, null: false
    	t.integer :num_beds, null: false

      t.timestamps
    end
    add_index :rooms, :house_id
  end
end
