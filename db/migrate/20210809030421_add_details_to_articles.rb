class AddDetailsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :material, :string
    add_column :articles, :language, :string
    add_column :articles, :period, :string
  end
end
