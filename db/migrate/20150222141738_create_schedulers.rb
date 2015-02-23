class CreateSchedulers < ActiveRecord::Migration
  def change
    create_table :schedulers do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :context
      t.text :details
      t.integer :user_id

      t.timestamps
    end
  end
end
