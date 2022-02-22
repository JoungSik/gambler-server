class Server < ApplicationRecord
  belongs_to :owner, class_name: "User"

  has_many :accounts
  has_many :histories
end
