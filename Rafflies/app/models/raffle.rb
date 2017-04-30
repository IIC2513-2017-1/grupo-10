class Raffle < ApplicationRecord
	has_many :numbers
	has_many :participants, through: :numbers, source: :user
	belongs_to :organizator, foreign_key: 'user_id', class_name: 'User'
	has_many :reactions
end
