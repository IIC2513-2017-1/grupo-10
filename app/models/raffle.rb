class Raffle < ApplicationRecord
	has_many :numbers
	has_many :participants, through: :numbers, source: :user
	belongs_to :organizator, class_name: 'User'
	has_many :reactions
	has_many :prizes
end
