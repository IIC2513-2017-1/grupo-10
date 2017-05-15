# frozen_string_literal: true

class Prize < ApplicationRecord
  belongs_to :raffle

  validates :name,
            presence: true,
            length: { in: 2..40 }
  validates :description,
            presence: true,
            exclusion: { in: [nil] },
            length: { maximum: 100 }
  validates :image, # http://stackoverflow.com/a/6645740/3281097
            presence: true
  validates :raffle,
            presence: true,
            exclusion: { in: [nil] }
end
