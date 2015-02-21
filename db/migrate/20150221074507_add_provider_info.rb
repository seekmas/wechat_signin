class AddProviderInfo < ActiveRecord::Migration
  def change
    add_column :users , :nickname , :string
    add_column :users , :headimgurl , :string
  end
end
