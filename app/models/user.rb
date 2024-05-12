class User < ApplicationRecord
  has_secure_password
  has_many :contents
  validates :firstName, :lastName, :email, :country, presence: true
  validates :email, uniqueness: true
end
