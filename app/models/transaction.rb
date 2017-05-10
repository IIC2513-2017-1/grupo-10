# frozen_string_literal: true

class CustomTransactionValidator < ActiveModel::Validator
  def validate(record)
    # Amount must be positive and greater than 0
    unless record.amount.positive?
      record.errors[:amount].push('A transaction amount must be greater than 0')
    end
    # A transaction can't be made between the same acount
    return unless record.from_wallet == record.to_wallet
    record.errors[:to_wallet].push(
      "Transaction can't be made between the same account"
    )
    record.errors[:from_wallet].push(
      "Transaction can't be made between the same account"
    )
  end
end

class Transaction < ApplicationRecord
  belongs_to :from_wallet, foreign_key: 'wallet_id', class_name: 'Wallet'
  belongs_to :to_wallet, foreign_key: 'wallet_id', class_name: 'Wallet'

  validates :amount,
            presence: true,
            numericality: true,
            exclusion: { in: [nil] }
  validates :from_wallet,
            presence: true,
            exclusion: { in: [nil] }
  validates :to_wallet,
            presence: true,
            exclusion: { in: [nil] }
  validates_associated :from_wallet
  validates_associated :to_wallet
  validates_with CustomTransactionValidator
end
