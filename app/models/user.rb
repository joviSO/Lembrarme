class User < ApplicationRecord
  has_secure_password

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { password.present? }

  has_many :lists, dependent: :destroy
  has_many :items, through: :lists
end
