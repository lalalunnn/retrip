class Article < ApplicationRecord

  belongs_to :user
  has_many :favorite_articles, dependent: :destroy

  def favorite_article_user(user_id)
   favorite_articles.find_by(user_id: user_id)
  end

  # favorite_articlesを通して関連するusersを取得
  # article/showのお気に入り一覧を出す時に使用
  has_many :article_lists, through: :favorite_articles, source: :user

  belongs_to :location

  validates :title, presence: true
  validates :body, presence: true
  validates :location_id, presence: true

  # carrierwaveとモデルの関連付け
  mount_uploader :image, ImageUploader
  # impressionableとモデルの関連付け
  is_impressionable
end
