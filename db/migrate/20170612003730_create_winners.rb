class CreateWinners < ActiveRecord::Migration[5.1]
  def change
    create_table :winners do |t|
      t.references :user, foreign_key: true
      t.references :raffle, foreign_key: true
      t.references :prize, foreign_key: true

      t.timestamps
    end
  end
end
