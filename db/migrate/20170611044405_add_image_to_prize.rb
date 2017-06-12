class AddImageToPrize < ActiveRecord::Migration[5.1]
  def change
    remove_column :prizes, :image
    add_attachment :prizes, :image
  end
end
