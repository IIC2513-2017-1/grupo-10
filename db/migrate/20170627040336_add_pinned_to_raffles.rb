class AddPinnedToRaffles < ActiveRecord::Migration[5.1]
  def change
    add_column :raffles, :pinned, :boolean, default: false
  end
end
