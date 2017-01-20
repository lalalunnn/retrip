class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    @dep = @locations.where(depth: 1).pluck(:id, :areaName, :parent_id)
    @child = @locations.where(depth: 2).pluck(:id, :areaName, :parent_id)
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @locations = Location.all
    # locationのリンク
    # params:idから紐付いたparent_idを、
    # location.allから参照して数字が合致する地名のまとまりを取得
    @children = Location.where(parent_id: @location.id)

    # showのarticle/index
    # 現在の表示中のロケーションの子ロケーションを全て取得
    # 取得してきた子ロケーションに紐づく記事を全て取得
    # @article_childsへ取得データを配列形式で代入
    @article_childs = []
    @location.self_and_descendants.each do |location|
      @article_eachlocations = Article.where(location_id: location.id).includes(:user)
      @article_eachlocations.each do |article|
        @article_childs << article
      end
    end
    # 配列の中身がlocationの取ってきた順になっているので並び替え
    @article_childs = @article_childs.sort.reverse

  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: '登録完了です' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: '編集できました' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:areaName, :parent_id)
    end
end
