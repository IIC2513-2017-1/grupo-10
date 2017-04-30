class Raffle < ApplicationRecord
	has_many :numbers
	has_many :participants, through: :numbers, source: :user
end
