class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :owner_id
      t.string :owner_type
      t.timestamps null: false
    end

    add_attachment :images, :image
  end
end
