class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]


  def index
    #index - all users
    #should have a search by feature
    @users = []
    if params[:search]
      @users = User.search(params[:search])
    end
    @user = User.find(session[:user_id])
  end

  def show
    @current_user = User.find(session[:user_id])
    # if logged_in?
    #   flash[:msg] = "Hello #{@current_user.name}!"
    # end
    @user = User.find(params[:id])
  end

  def new
    #users (and admins) can add new wines
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
    flash[:msg] = "Welcome to the BEST VINO APP EVER!"
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    #only admins can edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    byebug
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def delete
    #only admins can delete
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation, :birthday)
  end

end
