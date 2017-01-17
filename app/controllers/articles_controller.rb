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
      render :new, alert: '未入力の欄があります'
    end
  end

  # articleのshow
  def show
    @articles = Article.find(params[:id])
    if user_signed_in?
      @user_id = current_user.id
    end

    @article_id = @articles.id

    # headerパンくずリスト表示用
    @location = @article.location

  end

  private
    def set_user
      if user_signed_in?
        @user = User.find(current_user.id)
      end
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :location_id).merge(user_id: current_user.id)
    end
end

