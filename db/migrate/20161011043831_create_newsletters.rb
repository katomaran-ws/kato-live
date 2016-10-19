class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :name
      t.string :subject
      t.string :from_email
      t.boolean :status, :default => true

      t.timestamps null: false
    end
  end
end
