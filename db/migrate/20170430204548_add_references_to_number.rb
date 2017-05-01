class AddReferencesToNumber < ActiveRecord::Migration[5.0]
  def change
    add_reference :numbers, :user, foreign_key: true
    add_reference :numbers, :raffle, foreign_key: true
  end
end
