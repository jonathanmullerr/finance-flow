class RenameTransactionToEntry < ActiveRecord::Migration[6.1]
  def change
    rename_table :transactions, :entries
  end
end
