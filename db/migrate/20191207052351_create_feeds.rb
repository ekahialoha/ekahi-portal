class CreateFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.string :name, null: false, default: ''
      t.text :url, null: false, default: ''
      t.timestamps
    end
  end
end
