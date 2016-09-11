class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :full_name
      t.string :alias_name
      t.integer :sequence_number
      t.boolean :status, :default => true

      t.timestamps null: false
    end
  end
end
