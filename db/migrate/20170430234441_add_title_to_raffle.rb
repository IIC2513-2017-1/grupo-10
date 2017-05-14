class AddTitleToRaffle < ActiveRecord::Migration[5.0]
  def change
    add_column :raffles, :title, :string, null: false
  end
end
