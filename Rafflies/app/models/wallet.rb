class Wallet < ApplicationRecord
	has_many :payments, foreign_key: 'transaction_id', class_name: 'Transaction'
	has_many :charges, foreign_key: 'transaction_id', class_name: 'Transaction'
end
