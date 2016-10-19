class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :username
      t.string :phone
      t.boolean :active, :default => true
      t.string :status
      t.string :reset_password_code
      t.datetime :reset_code_until
      t.datetime :last_login
      t.string :remember_me_key
      t.string :remember_me_until

      t.timestamps null: false
    end
  end
end
