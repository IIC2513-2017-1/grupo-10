class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :mail, null: false, unique: true
      t.string :name, null: false
      t.string :password, null: false
      t.string :username, null: false, unique: true

      t.timestamps
    end
  end
end
