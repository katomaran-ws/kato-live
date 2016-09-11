class AddColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :category_id, :integer
    add_column :articles, :display_date, :datetime
  end
end
