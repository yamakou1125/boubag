class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def update
    current_user.allow(params[:user_id])
    redirect_to request.referer
  end

  def decline
    current_user.decline(params[:user_id])
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @allows = user.relationships.where(status: 1)
    @unapproved = user.relationships.where(status: 0)
  end

  def followers
    user = User.find(params[:user_id])
    @unapproved = user.reverse_of_relationships.where(status: 0)
    @allows = user.reverse_of_relationships.where(status: 1)
  end

end
