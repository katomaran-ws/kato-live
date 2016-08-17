class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :caption
      t.string :description
      t.boolean :status
      t.integer :title_image_id

      t.timestamps null: false
    end
  end
end
