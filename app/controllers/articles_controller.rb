class ArticlesController < ApplicationController
  def index
  end

  def show
    @article = Article.find(1)
  end

  def new
  end
end
