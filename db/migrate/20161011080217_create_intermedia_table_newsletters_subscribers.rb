class CreateIntermediaTableNewslettersSubscribers < ActiveRecord::Migration
  def change
    create_table :newsletters_subscribers, :id => false do |t|
      t.integer :newsletter_id
      t.integer :subscriber_id
    end
  end
end
