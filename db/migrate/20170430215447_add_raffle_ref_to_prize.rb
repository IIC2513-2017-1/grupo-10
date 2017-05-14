class AddRaffleRefToPrize < ActiveRecord::Migration[5.0]
  def change
    add_reference :prizes, :raffle, foreign_key: true
    change_column :prizes, :raffle_id, :integer, null: false
  end
end
