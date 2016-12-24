class FavoriteArticlesController < ApplicationController
  # お気に入り登録用アクション
  def create
    article = Article.find(params[:article_id])
    favorite_article = current_user.favorite_articles.build(article_id: article.id)
    favorite_article.save
    redirect_to article
  end

  # お気に入り削除用アクション
  def destroy
    article = Article.find(params[:article_id])
    favorite_article = current_user.favorite_articles.find_by(article_id: article.id)
    favorite_article.destroy
    redirect_to article
  end
end

