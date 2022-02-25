class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable,
         :omniauthable, omniauth_providers: %i[ discord ]

  has_many :accounts
  has_many :histories
  has_many :servers, foreign_key: "owner_id"

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.id = auth.uid
      user.email = auth.info.email
      user.password = "gambler_" + auth.info.name
      user.name = auth.info.name
    end
  end
end
