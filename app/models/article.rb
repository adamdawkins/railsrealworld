class Article < ApplicationRecord
  def self.tagged_with(name)
    Tag.find_by!(name: name).articles
  end
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

  def tag_list=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

end
