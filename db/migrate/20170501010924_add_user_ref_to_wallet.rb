class AddUserRefToWallet < ActiveRecord::Migration[5.0]
  def change
    add_reference :wallets, :user, foreign_key: true
  end
end
