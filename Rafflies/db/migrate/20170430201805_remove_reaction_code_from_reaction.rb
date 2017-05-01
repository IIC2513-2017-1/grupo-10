class RemoveReactionCodeFromReaction < ActiveRecord::Migration[5.0]
  def change
    remove_column :reactions, :reaction_code, :integer
  end
end
