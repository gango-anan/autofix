class User < ApplicationRecord
  has_secure_password
  validates :username, :password, presence: true
  validates :username, uniqueness: true
  validates :username, length: { within: 4..20 }
  validates :password, length: { minimum: 6 }
end
