class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.datetime :pub_date
      t.integer :feed_id
      t.string :link
      t.string :image

      t.timestamps
    end
    add_index :articles, :feed_id
  end
end
