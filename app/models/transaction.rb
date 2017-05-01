class Transaction < ApplicationRecord
	belongs_to :from_wallet, foreign_key: 'wallet_id', class_name: 'Wallet'
	belongs_to :to_wallet, foreign_key: 'wallet_id', class_name: 'Wallet'
end
