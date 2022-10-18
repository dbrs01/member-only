class Member < ApplicationRecord
  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true

  has_many :posts, dependent: :destroy;
end
