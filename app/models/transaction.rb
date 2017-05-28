# frozen_string_literal: true

class CustomTransactionValidator < ActiveModel::Validator
  def validate(record)
    # Amount must be positive and greater than 0
    unless record.amount.positive?
      record.errors[:amount].push('A transaction amount must be greater than 0')
    end
    # A transaction can't be made between the same acount
    return unless record.from_user == record.to_user
    record.errors[:to_user].push(
      "Transaction can't be made between the same account"
    )
    record.errors[:from_user].push(
      "Transaction can't be made between the same account"
    )
  end
end

class Transaction < ApplicationRecord
  belongs_to :from_user, class_name: 'User'
  belongs_to :to_user, class_name: 'User'
  belongs_to :raffle

  validates :amount,
            presence: true,
            numericality: true,
            exclusion: { in: [nil] }
  validates :from_user,
            presence: true,
            exclusion: { in: [nil] }
  validates :to_user,
            presence: true,
            exclusion: { in: [nil] }
  validates_associated :from_user
  validates_associated :to_user
  validates_with CustomTransactionValidator

  def self.transfer(from_user, to_user, amount)
    from_user.withdraw(amount)
    to_user.deposit(amount)
  end
end
