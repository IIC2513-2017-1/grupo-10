class RemoveWallet < ActiveRecord::Migration[5.1]
  def change
    drop_table :wallets
  end
end
