class AlterComment < ActiveRecord::Migration
  def change
    change_column :comments , :card_id , :uuid
  end
end
