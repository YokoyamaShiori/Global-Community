class AddSkypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :skype, :string
  end
end
