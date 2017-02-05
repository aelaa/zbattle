class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.string :name
      t.text :description
      t.datetime :deadline

      t.timestamps null: false
    end
  end
end
