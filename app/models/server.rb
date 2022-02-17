class Server < ApplicationRecord
  has_many :accounts
  has_many :histories
end
