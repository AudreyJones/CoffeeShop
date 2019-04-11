class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  has_many :drinks, through: :orders
  validates :username, presence: true
  validates :email, presence: true
end
