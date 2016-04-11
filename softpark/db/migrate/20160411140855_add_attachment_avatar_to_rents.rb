class AddAttachmentAvatarToRents < ActiveRecord::Migration
  def self.up
    change_table :rents do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :rents, :avatar
  end
end
