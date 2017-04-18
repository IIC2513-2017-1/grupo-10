class CreatePrizes < ActiveRecord::Migration[5.0]
  def change
    create_table :prizes do |t|
      t.string :short_description
      t.string :long_description

      t.timestamps
    end
  end
end
