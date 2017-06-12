class AddImageToReactionRepresentation < ActiveRecord::Migration[5.1]
  def change
    remove_column :reaction_representations, :image
    add_attachment :reaction_representations, :image
  end
end
