class AddOrganizatorToRaffle < ActiveRecord::Migration[5.0]
  def change
    add_reference :raffles, :organizator, null: false
  end
end
