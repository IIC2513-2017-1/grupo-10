json.raffle do
  json.id @raffle.id
  json.href api_v1_raffle_url(@raffle)
  json.description @raffle.description
  json.title @raffle.title
  json.price @raffle.price
  json.number_amount @raffle.number_amount
  json.private @raffle.private
  json.finished @raffle.finished
  json.organizator do
    json.id @raffle.organizator.id
    json.href api_v1_user_url(@raffle.organizator)
    json.mail @raffle.organizator.mail
    json.name @raffle.organizator.name
    json.username @raffle.organizator.username
    json.role @raffle.organizator.role
    json.amount @raffle.organizator.amount
  end
  json.prizes @raffle.prizes do |prize|
    json.id prize.id
    json.description prize.description
    json.image prize.image_file_name
  end
  json.numbers @raffle.numbers do |number|
    json.id number.id
    json.number_in_raffle number.number_in_raffle
    json.owner do
      json.id number.user.id
      json.href api_v1_user_url(number.user)
      json.mail number.user.mail
      json.name number.user.name
      json.username number.user.username
      json.role number.user.role
      json.amount number.user.amount
    end
  end
  # json.participants @raffle.participants do |participant|
  #   json.id participant.id
  #   json.href api_v1_user_url(participant)
  #   json.mail participant.mail
  #   json.name participant.name
  #   json.username participant.username
  #   json.role participant.role
  #   json.amount participant.amount
  # end
end