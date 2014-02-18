class AddAttachmentImageToStatuses < ActiveRecord::Migration
  def self.up
    change_table :statuses do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :statuses, :image
  end
end
