class AddIndexUrlHashToArticles < ActiveRecord::Migration[6.0]
  def change
    add_index :articles, :url_hash
  end
end
