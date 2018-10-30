class User < ApplicationRecord
  has_secure_password

  extend FriendlyId
  friendly_id :username

  has_many :articles, foreign_key: 'author_id'

  validates_presence_of :username
end
