class WinesController < ApplicationController

  def index
  #index - all wines
  #should have a search by feature
  # byebug
  @wines = Wine.all
  @user = User.find(session[:user_id])
  @top_saved = UserWine.top_saved_wine
  end

  def show
    @wine = Wine.find(params[:id])
    @user = User.find(session[:user_id])

    if UserWine.find_by(wine: @wine, user: @user) && UserWine.find_by(wine: @wine, user: @user).rating != nil
      @user_rating = UserWine.find_by(wine: @wine, user: @user).rating
    else
      @user_rating = "You have not rated this wine."
    end
    @rating = @wine.rating
    @userwine = UserWine.new
  end

  def new
    #users (and admins) can add new wines
    @wine = Wine.new
    @recipes = Recipe.all
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @wine = Wine.new(wine_params)
    # @user_wine = UserWine.new(user: @user)

    if @wine.save
      # @wine.user_wines << @user_wine
      redirect_to wine_path(@wine)
    else
      flash[:error] = @wine.errors.full_messages
      redirect_to new_wine_path
    end

  end

  def edit
    #only admins can edit
    @wine = Wine.find(params[:id])
    @recipes = Recipe.all
    @user = User.find(session[:user_id])
    @wine.user_wines.find_or_create_by(user: @user)
  end

  def update
    @recipes = Recipe.all
    @user = User.find(session[:user_id])
    @wine = Wine.find(params[:id])
    if @wine.update(wine_params)
      redirect_to wine_path(@wine)
    else
      flash[:error] = @wine.errors.full_messages
      redirect_to edit_wine_path(@wine)
    end
  end

  def delete
    #only admins can delete
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect_to wines_path
  end

  private

  def wine_params
    params.require(:wine).permit(:name, :year, :country, :price, user_wines_attributes: [:user_id, :rating], recipe_ids: [], recipes_attributes: [:name, :difficult_level, :cost])
  end
end
