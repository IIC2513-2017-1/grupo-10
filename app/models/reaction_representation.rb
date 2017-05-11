# frozen_string_literal: true

class ReactionRepresentation < ApplicationRecord
  has_many :reactions, dependent: :destroy

  validates :image, # http://stackoverflow.com/a/6645740/3281097
            presence: true
  validates :description,
            presence: true,
            length: { in: 2..40 }
end
