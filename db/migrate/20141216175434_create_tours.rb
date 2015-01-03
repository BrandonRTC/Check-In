class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
    	t.boolean :completed, default: false
    	t.integer :house_id, null: false
    	
      t.timestamps
    end
    add_index :tours, :house_id
  end
end
