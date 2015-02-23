class AddAttachment < ActiveRecord::Migration
  def self.up
    add_attachment :medals, :cover
  end

  def self.down
    remove_attachment :medals, :cover
  end
end
