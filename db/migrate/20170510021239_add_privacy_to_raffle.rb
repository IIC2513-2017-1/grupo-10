class AddPrivacyToRaffle < ActiveRecord::Migration[5.0]
  def change
    add_column :raffles, :private, :boolean, null: false
  end
end
