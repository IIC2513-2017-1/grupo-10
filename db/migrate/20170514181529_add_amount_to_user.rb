class AddAmountToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :amount, :integer, null: false
  end
end
