class ArticlesController < ApplicationController
before_action :set_article, only: [ :show]

  def index
    # 注目のまとめ
    @articles = Article.all.page(params[:page]).per(10).order("created_at DESC")

    # indexMain(3画像)
    @sliders = Article.order("RAND()").limit(3)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      redirect_to new_article_path
    end
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.permit( :image, :body, :title)
      # params.require(:article).permit( :image, :body, :title)
    end
end
