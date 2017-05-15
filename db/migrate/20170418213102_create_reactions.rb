class CreateReactions < ActiveRecord::Migration[5.0]
  def change
    create_table :reactions do |t|
      t.integer :reaction_code, null: false

      t.timestamps
    end
  end
end
