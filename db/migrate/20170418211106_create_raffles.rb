class CreateRaffles < ActiveRecord::Migration[5.0]
  def change
    create_table :raffles do |t|
      t.datetime :end_date, null: false
      t.datetime :start_date, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
