# frozen_string_literal: true

class CustomUserValidator < ActiveModel::Validator
  def validate(record)
    # Amount cant be negative
    return unless record.amount.negative?
    record.errors[:amount].push("Amount can't be negative")
  end
end

class User < ApplicationRecord
  has_secure_password

  enum role: %i[user admin]

  has_many :numbers, dependent: :destroy
  has_many :raffle_participating, through: :numbers, source: :raffle
  has_many :raffles, foreign_key: 'organizator_id', dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :requests, dependent: :destroy

  validates :mail,
            presence: true,
            uniqueness: true,
            allow_black: false,
            format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name,
            presence: true,
            length: { in: 2..60 },
            exclusion: { in: [nil] }
  validates :password,
            presence: true,
            length: { minimum: 6 },
            confirmation: true,
            allow_blank: false
  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { in: 2..40 },
            exclusion: { in: [nil] }
  validates :role,
            presence: true,
            inclusion: { in: roles.keys },
            exclusion: { in: [nil] }
  validates :amount,
            presence: true,
            numericality: true,
            exclusion: { in: [nil] }
  validates_with CustomUserValidator
end
