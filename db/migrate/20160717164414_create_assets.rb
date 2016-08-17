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
      t.boolean :is_cloudinary
      t.integer :gallery_id

      t.timestamps null: false
    end
  end
end
