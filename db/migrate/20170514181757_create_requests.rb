class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.integer :amount, null: false
      t.boolean :approved, null: false

      t.timestamps
    end
  end
end
