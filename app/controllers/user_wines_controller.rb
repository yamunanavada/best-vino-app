class UserWinesController < ApplicationController

  def index

  end

  def new
    @userwine = UserWine.new

  end

  def create
    @user = User.find(session[:user_id])
    @userwine = @user.user_wines.find_or_create_by(wine_id: user_wine_params[:wine_id], rating: user_wine_params[:rating])
    if @userwine.save
      flash[:notice] = "Added that vino!"
      redirect_to wine_path(Wine.find(user_wine_params[:wine_id]))
    else
      flash[:notice] = "Darn, unable to save that vino!"
      redirect_to wines_path
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @wine = Wine.find(params[:wine_id])
    @userwine = UserWine.find_by(user: @user, wine: @wine)
    @userwine.destroy
    redirect_to wines_path
  end

  private

  def user_wine_params
    params.require(:user_wine).permit(:wine_id, :rating)
  end

end
