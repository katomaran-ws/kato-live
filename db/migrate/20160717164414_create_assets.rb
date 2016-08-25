class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :title
      t.string :alias_name
      t.string :caption
      t.boolean :status, :default => true
      t.string :access
      t.integer :access_code
      t.string :location
      t.integer :sequence_number
      t.string :asset_type
      t.string :is_cloudinary
      t.integer :gallery_id
      t.string :cloudinary_url

      t.timestamps null: false
    end
  end
end
