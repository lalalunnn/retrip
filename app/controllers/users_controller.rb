class UsersController < ApplicationController
  def show
    # ログイン中のユーザーが登録したお気に入り一覧
    @user = User.find(current_user.id)
    @articles = Article.where(user_id: current_user.id)
    @user_likes_list = @user.user_likes.sort.reverse
  end
end
