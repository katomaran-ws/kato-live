class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name_of_model
      t.string :downloadable_fields, :default => ""
      t.boolean :status, :default => true

      t.timestamps null: false
    end
  end
end
