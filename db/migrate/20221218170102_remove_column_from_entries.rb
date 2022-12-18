class RemoveColumnFromEntries < ActiveRecord::Migration[6.1]
  def change
    remove_column :entries, :transaction_type
  end
end
