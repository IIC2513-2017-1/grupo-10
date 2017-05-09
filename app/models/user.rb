class User < ApplicationRecord
	enum role: [:user, :admin]

	has_many :numbers
	has_many :raffle_participating, through: :numbers, source: :raffle
	has_many :raffles, foreign_key: 'organizator_id'
	has_many :reactions
	has_one :wallet, dependent: :destroy
end
