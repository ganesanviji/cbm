class AddAvatarToUser < ActiveRecord::Migration
  def self.up
    #add_attachment :references, :avatar
  end

  def self.down
    #remove_attachment :references, :avatar
  end
end
