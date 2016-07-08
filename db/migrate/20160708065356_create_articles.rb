class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :alias_url
      t.boolean :status
      t.integer :most_read_count
      t.integer :rating
      t.integer :sequence_number

      t.timestamps null: false
    end
  end
end
