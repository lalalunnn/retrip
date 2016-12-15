class Article < ApplicationRecord
  has_many :favorite_articles
  has_many :users, through: :favorite_articles

  validates :title, presence: true
  validates :body, presence: true
end
