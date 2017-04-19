class CreateBattleWorks < ActiveRecord::Migration
  def change
    create_table :battle_works do |t|
      t.references :user
      t.text :description
      t.string :software

      t.timestamps null: false
    end
  end
end
