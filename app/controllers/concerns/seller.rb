# frozen_string_literal: true

module Seller
  extend ActiveSupport::Concern

  def enough_money?(user, amount)
    user.amount >= amount
  end

  def sell(raffle, numbers)
    total_amount = numbers.size * raffle.price
    return unless enough_money?(current_user, total_amount)
    organizator = raffle.organizator
    raffle.numbers.create number_params(numbers)
    Transaction.transfer(current_user, organizator, total_amount)
    raffle.transactions.create  amount: total_amount,
                                from_user: current_user,
                                to_user: organizator
  end

  def number_params(numbers)
    numbers.collect do |number|
      { user: current_user, number_in_raffle: number }
    end
  end
end
