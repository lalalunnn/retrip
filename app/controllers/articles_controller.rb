class ArticlesController < ApplicationController
before_action :set_user, only: [ :new, :create, :show]
before_action :set_article, only: [:show]


  def index
    # 注目のまとめ(全レコードの取得)
    @articles = Article.page(params[:page]).per(5).order("created_at DESC").includes(:user)

    # indexMain(3画像)
    @sliders = Article.order("RAND()").limit(3).includes(:user)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to root_path, notice: '投稿できました'
    else
      redirect_to @article, alert: 'メッセージを入力してください'
    end
  end

  # articleのshow
  def show
    @articles = Article.find(params[:id])
    @article_id = @articles.id

    @user_id = current_user.id

  end

  private
    def set_user
      @user = User.find(current_user.id)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body).merge(user_id: current_user.id)
    end
end

