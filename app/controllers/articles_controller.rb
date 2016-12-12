class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(1)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(create_params)
    if @article.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private
    def create_params
      params.permit( :image, :body, :title)
      # params.require(:article).permit( :image, :body, :title)
    end
end
