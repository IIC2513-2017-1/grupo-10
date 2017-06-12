class AddFinishedToRaffle < ActiveRecord::Migration[5.1]
  def change
    add_column :raffles, :finished, :bool, default: false
  end
end
