# frozen_string_literal: true

class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :raffle
  belongs_to :reaction_representation

  validates :user,
            presence: true,
            exclusion: { in: [nil] }
  validates :raffle,
            presence: true,
            exclusion: { in: [nil] }
  validates :reaction_representation,
            presence: true,
            exclusion: { in: [nil] }
  validates_associated :user
  validates_associated :raffle
  validates_associated :reaction_representation
end
