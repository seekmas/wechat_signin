class CreateCardMedals < ActiveRecord::Migration
  def change
    create_table :card_medals do |t|
      t.integer :card_id
      t.integer :medal_id

      t.timestamps
    end
  end
end
