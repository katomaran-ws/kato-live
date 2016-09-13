class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :alias_url
      t.boolean :status
      t.string :article_type
      t.string :heading_block
      t.string :author
      t.integer :most_read_count
      t.integer :rating
      t.integer :sequence_number
      t.integer :updated_by
      t.integer :created_by
      t.datetime :display_date
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
