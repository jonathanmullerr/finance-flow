class AddUseridColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :user_id, :integer
    add_column :categories, :user_id, :integer
  end
end
