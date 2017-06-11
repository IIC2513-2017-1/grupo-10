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

  has_attached_file :image,
                    styles: { small: '64x64', med: '100x100', large: '200x200' }
  enum role: %i[user admin]

  has_many :numbers, dependent: :destroy
  has_many :raffle_participating, through: :numbers, source: :raffle
  has_many :raffles, foreign_key: 'organizator_id', dependent: :destroy
  has_many :reactions, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many  :made_transactions,
            foreign_key: 'from_user',
            class_name: 'Transaction',
            dependent: :destroy
  has_many  :received_transactions,
            foreign_key: 'to_user',
            class_name: 'Transaction',
            dependent: :destroy

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
            allow_blank: false,
            on: :create
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
  validates_attachment_content_type :image,
                                    content_type: %r{\Aimage\/.*\z}
  validates_attachment_size :image,
                            less_than: 5.megabytes

  def withdraw(amount)
    self.amount -= amount
    save
  end

  def deposit(amount)
    self.amount += amount
    save
  end
end
