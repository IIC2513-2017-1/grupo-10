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

  def user_has_money?(raffle, numbers)
    current_user.amount >= (numbers.size * raffle.price)
  end

  def sell(raffle, numbers)
    if valid_number_set(raffle, numbers) && user_has_money?(raffle, numbers)
      numbers.each do |number|
        raffle.numbers.create(number_params(raffle, number))
      end
      current_user.amount -= numbers.size * raffle.price
      current_user.save
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
