class AddImageToModel < ActiveRecord::Migration
  def self.up
    add_attachment :models, :avatar
  end

  def self.down
    remove_attachment :models, :avatar
  end
end
