# frozen_string_literal: true

module Seller
  extend ActiveSupport::Concern

  def valid_number_set(raffle, numbers)
    sold_numbers = raffle.numbers.pluck(:number_in_raffle)
    numbers.each do |number|
      return false if sold_numbers.include?(number.to_i)
    end
    true
  end

  def sell(raffle, numbers)
    if valid_number_set(raffle, numbers)
      numbers.each do |number|
        raffle.numbers.create(number_params(raffle, number))
      end
      true
    else
      false
    end
  end

  def number_params(raffle, number)
    {
      user: current_user,
      raffle: raffle,
      number_in_raffle: number
    }
  end
end
