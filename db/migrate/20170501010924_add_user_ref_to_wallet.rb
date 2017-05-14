class AddUserRefToWallet < ActiveRecord::Migration[5.0]
  def change
    add_reference :wallets, :user, foreign_key: true
    change_column :wallets, :user_id, :integer, null: false
  end
end
