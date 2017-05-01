class AddWalletRefToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :wallet, foreign_key: true
  end
end
