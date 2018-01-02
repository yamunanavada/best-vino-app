class FriendshipsController < ApplicationController

  def new
    @friendship = Friendship.new
  end

  def create
    @current_user = User.find(session[:user_id])
    @friendship = Friendship.find_or_create_by(user_id: @current_user.id, friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to user_path(@current_user)
    else
      flash[:notice] = "Unable to add friend."
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    byebug
    @friendship = @user.friendships.find_by(friend: params[:format])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to user_path(@user)
  end

end
