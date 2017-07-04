# frozen_string_literal: true

module TwitterAPI
  def tweet_raffle(raffle)
    consumer = OAuth::Consumer.new(ENV['OAUTH_KEY'],
                                   ENV['OAUTH_SECRET'],
                                   site: 'https://api.twitter.com',
                                   scheme: :header)

    access_token = OAuth::AccessToken.new(consumer,
                                          session[:token],
                                          session[:secret])

    message = 'Take part in the raffle I\'m organizing!'
    message += "\n#{raffle.title}\n#{raffle_url(raffle)}"

    access_token.post(
      '/1.1/statuses/update.json',
      status: message
    )
  end
end
