class CreateRaffles < ActiveRecord::Migration[5.0]
  def change
    create_table :raffles do |t|
      t.datetime :end_date
      t.datetime :start_date
      t.string :description

      t.timestamps
    end
  end
end
