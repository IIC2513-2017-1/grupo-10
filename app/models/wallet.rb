# frozen_string_literal: true

class CustomWalletValidator < ActiveModel::Validator
  def validate(record)
    # Amount cant be negative
    return unless record.amount.negative?
    record.errors[:amount].push("Wallet amount can't be negative")
  end
end

class Wallet < ApplicationRecord
  has_many :payments, foreign_key: 'transaction_id', class_name: 'Transaction'
  has_many :charges, foreign_key: 'transaction_id', class_name: 'Transaction'
  belongs_to :user

  validates :amount,
            presence: true,
            numericality: true,
            exclusion: { in: [nil] }
  validates :user,
            presence: true,
            exclusion: { in: [nil] }
  validates_associated :user
  validates_with CustomWalletValidator
end
