# frozen_string_literal: true

class CustomRaffleValidator < ActiveModel::Validator
  def validate(record) # rubocop:disable Metrics/AbcSize
    # Can not start after finish
    if record.start_date > record.end_date
      record.errors[:end_date].push('Raffle must end after start')
    end
    # Can not start in the past
    unless record.start_date >= Date.today
      record.errors[:start_date].push("Raffle can't start in the past")
    end
    # At least one day of duration
    return if record.end_date - record.start_date >= 1.day
    record.errors[:start_date].push('Raffle duration should at least be 1 day')
    record.errors[:end_date].push('Raffle duration should at least be 1 day')
  end
end

class Raffle < ApplicationRecord
  belongs_to :organizator, class_name: 'User'
  has_many :numbers, dependent: :destroy
  has_many :participants, through: :numbers, source: :user
  has_many :reactions, dependent: :destroy
  has_many :prizes, dependent: :destroy
  has_many :transactions, dependent: :destroy

  validates :end_date,
            presence: true,
            exclusion: { in: [nil] }
  validates :start_date,
            presence: true,
            exclusion: { in: [nil] }
  validates :description,
            presence: true,
            exclusion: { in: [nil] },
            length: { maximum: 100 }
  validates :organizator,
            presence: true,
            exclusion: { in: [nil] }
  validates :title,
            presence: true,
            length: { in: 2..40 }
  validates :price,
            presence: true,
            numericality: true,
            exclusion: { in: [nil] }
  validates :number_amount,
            presence: true,
            numericality: true,
            exclusion: { in: [nil] }
  validates :private,
            inclusion: { in: [true, false] }
  validates_with CustomRaffleValidator,
                 on: :create

  def self.select_data(raffles)
    raffles.as_json(include:       {
                      numbers:         { only: :number_in_raffle }
                    },
                    include_blank: 'No number')
  end
end
