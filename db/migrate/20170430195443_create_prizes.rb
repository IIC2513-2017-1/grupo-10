class CreatePrizes < ActiveRecord::Migration[5.0]
  def change
    create_table :prizes do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
