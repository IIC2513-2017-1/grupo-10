# frozen_string_literal: true

json.tweet do
  json.id @tweet.id
  json.content @tweet.content
  json.private @tweet.private
  json.user do
    json.email @tweet.user.email
    json.first_name @tweet.user.first_name
    json.last_name @tweet.user.last_name
  end
end
