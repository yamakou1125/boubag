class RelationshipsController < ApplicationController

  # フォロリク送信するとき
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end
  # フォロー外しとフォロリク取消し
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  #フォロリク承認
  def update
    current_user.allow(params[:user_id])
    redirect_to request.referer
  end
  # フォロリク拒否
  def decline
    current_user.decline(params[:user_id])
    redirect_to request.referer
  end
  # フォロー中と承認待ち一覧
  def followings
    user = User.find(params[:user_id])
    @allows = user.relationships.where(status: 1)
    @unapproved = user.relationships.where(status: 0)
  end
  # フォロワーと承認待ち一覧
  def followers
    user = User.find(params[:user_id])
    @unapproved = user.reverse_of_relationships.where(status: 0)
    @allows = user.reverse_of_relationships.where(status: 1)
  end

end
