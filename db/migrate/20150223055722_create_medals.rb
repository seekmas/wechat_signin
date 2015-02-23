class CreateMedals < ActiveRecord::Migration
  def change
    create_table :medals do |t|
      t.string :name
      t.string :cover
      t.boolean :enabled

      t.timestamps
    end
  end
end
