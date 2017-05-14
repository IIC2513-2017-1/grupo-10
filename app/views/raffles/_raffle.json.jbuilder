# frozen_string_literal: true

json.extract! raffle, :id, :end_date, :start_date,
              :description, :created_at, :updated_at
json.url raffle_url(raffle, format: :json)
