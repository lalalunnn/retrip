class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_many :favorite_articles


  # favorite_articlesを通して関連するarticlesを取得
  # user/showのお気に入り一覧を出す時に使用
  has_many :user_likes, through: :favorite_articles, source: :article
end
