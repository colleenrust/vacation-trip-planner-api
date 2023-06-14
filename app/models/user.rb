class User < ApplicationRecord
  require 'bcrypt'
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :trips
end
