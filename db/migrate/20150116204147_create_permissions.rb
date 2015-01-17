class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
    	t.integer :user_id
    	t.integer :house_id

      t.timestamps
    end

    add_index :permissions, :user_id
    add_index :permissions, :house_id
  end
end
