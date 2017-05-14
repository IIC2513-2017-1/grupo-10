class AddReferencesToNumber < ActiveRecord::Migration[5.0]
  def change
    add_reference :numbers, :user, foreign_key: true
    change_column :numbers, :user_id, :integer, null: false
    add_reference :numbers, :raffle, foreign_key: true
    change_column :numbers, :raffle_id, :integer, null: false
  end
end
