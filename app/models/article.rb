class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :author
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :body

  self.per_page = 20
end
