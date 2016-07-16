class CreateArticleContents < ActiveRecord::Migration
  def change
    create_table :article_contents do |t|

      t.integer :article_id
      t.text :content
      t.string :meta_keywords
      t.string :meta_description
      t.string :page_title
      t.string :banner_image_url
      t.integer :updated_by
      t.integer :created_by

      t.timestamps null: false
    end
  end
end
