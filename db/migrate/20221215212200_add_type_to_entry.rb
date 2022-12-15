class AddTypeToEntry < ActiveRecord::Migration[6.1]
  def change
    add_column :entries, :type, :string
  end
end
