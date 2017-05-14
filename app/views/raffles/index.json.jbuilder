# frozen_string_literal: true

json.array! @raffles, partial: 'raffles/raffle', as: :raffle
