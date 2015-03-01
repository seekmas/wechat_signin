class AlterType < ActiveRecord::Migration
  def change
    change_column :card_medals , :card_id , :uuid
  end
end
