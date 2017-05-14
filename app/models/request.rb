# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :user

  validates :approved,
            presence: true,
            exclusion: { in: [nil] }
  validates :amount,
            presence: true,
            numericality: true,
            exclusion: { in: [nil] }
  validates_associated :user
end
