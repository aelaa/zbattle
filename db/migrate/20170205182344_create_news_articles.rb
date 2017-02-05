class CreateNewsArticles < ActiveRecord::Migration
  def change
    create_table :news_articles do |t|
      t.string :name
      t.text :article

      t.timestamps null: false
    end
  end
end
