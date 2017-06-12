class Winner < ApplicationRecord
  belongs_to :user
  belongs_to :raffle
  belongs_to :prize
end
