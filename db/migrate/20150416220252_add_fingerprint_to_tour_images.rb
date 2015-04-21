class AddFingerprintToTourImages < ActiveRecord::Migration
  def change
  	add_column :tours, :start_img_fingerprint, :string
  	add_column :tours, :end_img_fingerprint, :string
  end
end
