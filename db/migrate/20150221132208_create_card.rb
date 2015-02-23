class CreateCard < ActiveRecord::Migration
  def self.up
    create_table :cards, :id => false  do |t|
      t.uuid :id, :primary_key => true

      t.string :name
      t.integer :age
      t.string :city
      t.timestamp :start
      t.text :signature
      t.integer :user_id

      t.timestamps
    end
    add_index :cards, :id
  end

  def self.down
    drop_table :cards
  end
end
