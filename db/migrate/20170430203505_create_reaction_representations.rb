class CreateReactionRepresentations < ActiveRecord::Migration[5.0]
  def change
    create_table :reaction_representations do |t|
      t.string :image, null: false
	  t.string :description, null: false

      t.timestamps
    end
  end
end
