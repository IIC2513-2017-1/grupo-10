class AddRaffleReferenceToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_reference :transactions, :raffle, foreign_key: true
  end
end
