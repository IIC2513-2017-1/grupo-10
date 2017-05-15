class AddReferencesToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :from_wallet, null: false
    add_reference :transactions, :to_wallet, null: false
  end
end
