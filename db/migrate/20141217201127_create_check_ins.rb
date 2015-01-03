class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
    	t.string :status, null: false
    	t.string :initials
    	t.string :comment
    	t.integer :room_id, null: false

      t.timestamps
    end
    add_index :check_ins, :room_id
  end
end
