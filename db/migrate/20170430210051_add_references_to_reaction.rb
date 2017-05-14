class AddReferencesToReaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :reactions, :user, foreign_key: true
    change_column :reactions, :user_id, :integer, null: false
    add_reference :reactions, :raffle, foreign_key: true
    change_column :reactions, :raffle_id, :integer, null: false
    add_reference :reactions, :reaction_representation, foreign_key: true
    change_column :reactions, :reaction_representation_id, :integer, null: false
  end
end
