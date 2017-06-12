# frozen_string_literal: true

class Winner < ApplicationRecord
  belongs_to :user
  belongs_to :raffle
  belongs_to :prize

  def self.format_json(winners)
    winners = winners.as_json(include: {
                                user: { only: %i[username id] },
                                prize: { only: :name }
                              })
    output = []
    winners.map! do |winner|
      temp = {}
      temp['username'] = winner['user']['username']
      temp['url'] = Rails.application.routes.url_helpers.user_path(winner['user']['id'])
      temp['prize'] = winner['prize']['name']
      output << temp
    end
    output
  end
end
