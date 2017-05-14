class ModifyColumnNamesFromTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :from_wallet_id
    remove_column :transactions, :to_wallet_id

    add_column :transactions, :from_user_id, :integer
    add_column :transactions, :to_user_id, :integer
  end
end
