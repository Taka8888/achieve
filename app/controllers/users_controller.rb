class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user =User.find(params[:id])
    @user_followed =@user.followed_users
    @user_follower =@user.followers
  end
end
