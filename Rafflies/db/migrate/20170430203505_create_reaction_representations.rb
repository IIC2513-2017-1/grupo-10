class CreateReactionRepresentations < ActiveRecord::Migration[5.0]
  def change
    create_table :reaction_representations do |t|
      t.string :image
			t.string :description

      t.timestamps
    end
  end
end
