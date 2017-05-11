# frozen_string_literal: true

class User < ApplicationRecord
  enum role: %i[user admin]

  has_many :numbers, dependent: :destroy
  has_many :raffle_participating, through: :numbers, source: :raffle
  has_many :raffles, foreign_key: 'organizator_id', dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_one :wallet, dependent: :destroy

  validates :mail,
            presence: true,
            uniqueness: { case_sensitive: false },
            exclusion: { in: [nil] }
  validates :name,
            presence: true,
            length: { in: 2..60 },
            exclusion: { in: [nil] }
  validates :password,
            presence: true,
            length: { in: 6..40 },
            confirmation: true,
            exclusion: { in: [nil] }
  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { in: 2..40 },
            exclusion: { in: [nil] }
  validates :role,
            presence: true,
            inclusion: { in: roles.keys },
            exclusion: { in: [nil] }
end
