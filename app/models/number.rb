# frozen_string_literal: true

class CustomNumberValidator < ActiveModel::Validator
  def validate(record)
    # Number between raffle limits
    unless record.number_in_raffle.between?(1, record.raffle.number_amount)
      record.errors[:number_in_raffle].push(
        'Number in raffle must be between limits'
      )
    end
    # Number is unique in raffle
    return if find_dupes(record).blank?
    record.errors[:number_in_raffle].push('Number is already taken')
  end

  private

  def find_dupes(record)
    record.raffle.numbers.find_by(number_in_raffle: record.number_in_raffle)
  end
end

class Number < ApplicationRecord
  belongs_to :user
  belongs_to :raffle

  validates :number_in_raffle,
            presence: true,
            numericality: true,
            exclusion: { in: [nil] }
  validates :user,
            presence: true,
            exclusion: { in: [nil] }
  validates :raffle,
            presence: true,
            exclusion: { in: [nil] }
  validates_associated :user
  validates_associated :raffle
  validates_with CustomNumberValidator
end
