class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
    	t.string :house_name, null: false

      t.timestamps
    end
  end
end
