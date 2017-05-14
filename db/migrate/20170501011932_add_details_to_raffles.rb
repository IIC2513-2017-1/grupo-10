class AddDetailsToRaffles < ActiveRecord::Migration[5.0]
  def change
    add_column :raffles, :price, :integer, null: false
    add_column :raffles, :number_amount, :integer, null: false
  end
end
