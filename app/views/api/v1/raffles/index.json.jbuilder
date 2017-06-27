# frozen_string_literal: true

json.raffles do
  json.array! @raffles do |raffle|
		json.id raffle.id
		json.href api_v1_raffle_url(raffle)
		json.description raffle.description
		json.title raffle.title
		json.price raffle.price
		json.number_amount raffle.number_amount
		json.private raffle.private
		json.finished raffle.finished
		json.organizator do
		  json.id raffle.organizator.id
		  json.href api_v1_user_url(raffle.organizator)
		  json.mail raffle.organizator.mail
		  json.name raffle.organizator.name
		  json.username raffle.organizator.username
		  json.role raffle.organizator.role
		  json.amount raffle.organizator.amount
		end
  end
end
