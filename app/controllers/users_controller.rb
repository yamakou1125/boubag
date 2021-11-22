class UsersController < ApplicationController

  def mypage
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(is_active: true)
    reset_session
    redirect_to users_thanks_path
  end

  def thanks
  end

  def search
    @users = User.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
