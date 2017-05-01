class AddRaffleRefToPrize < ActiveRecord::Migration[5.0]
  def change
    add_reference :prizes, :raffle, foreign_key: true
  end
end
