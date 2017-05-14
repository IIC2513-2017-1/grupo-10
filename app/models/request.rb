# frozen_string_literal: true

class ApprovedFalseValidator < ActiveModel::Validator
  def validate(record)
    return if record.approved
    record.errors[:approved].push('Approved must be false on creation')
  end
end

class CustomRequestValidator < ActiveModel::Validator
  def validate(record)
    # Amount must be positive and greater than 0
    return unless record.amount.positive?
    record.errors[:amount].push('Requested amount must be greater than 0')
  end
end

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
  validates_with CustomRequestValidator
  validates_with ApprovedFalseValidator, on: :create
end
