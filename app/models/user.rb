class User < ApplicationRecord
  has_secure_password
  validates :firstName, :lastName, :email, :country, presence: true
  validates :email, uniqueness: true
end
