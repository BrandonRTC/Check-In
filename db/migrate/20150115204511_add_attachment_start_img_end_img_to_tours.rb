class AddAttachmentStartImgEndImgToTours < ActiveRecord::Migration
  def self.up
    change_table :tours do |t|
      t.attachment :start_img
      t.attachment :end_img
    end
  end

  def self.down
    remove_attachment :tours, :start_img
    remove_attachment :tours, :end_img
  end
end
