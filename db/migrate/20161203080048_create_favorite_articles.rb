class CreateFavoriteArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_articles do |t|

      t.timestamps
    end
  end
end
