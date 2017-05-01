class Reaction < ApplicationRecord
	belongs_to :user
	belongs_to :raffle
	belongs_to :reaction_representation
end
