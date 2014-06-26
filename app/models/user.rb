class User < ActiveRecord::Base
  has_many :reservations
  has_secure_password
  validates :email, uniqueness: true
end
