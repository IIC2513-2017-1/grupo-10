class AddReferencesToReaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :reactions, :user, foreign_key: true
    add_reference :reactions, :raffle, foreign_key: true
    add_reference :reactions, :reaction_representation, foreign_key: true
  end
end
