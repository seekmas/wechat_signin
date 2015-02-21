class AlterHeadimgurl < ActiveRecord::Migration
  def change
    change_column :users , :headimgurl , :text
  end
end
