class RecipesController < ApplicationController

  def index
  #index - all recipes
  #should have a search by feature
    @recipes = Recipe.all
    @user = User.find(session[:user_id])
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = User.find(session[:user_id])
    @difficulty = Recipe.difficulty[@recipe.difficult_level.to_i - 1][0]
  end

  def new
    #users (and admins) can add new wines
    @recipe = Recipe.new
    @difficult = Recipe.difficulty
    @wines = Wine.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      flash[:error] = @recipe.errors.full_messages
      redirect_to new_recipe_path
    end

  end

  def edit
    #only admins can edit
    @recipe = Recipe.find(params[:id])
    @difficult = Recipe.difficulty
    @wines = Wine.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      redirect_to edit_recipe_path(@recipe)
    end
  end

  def delete
    #only admins can delete
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :difficult_level, :cost, wine_ids: [], wines_attributes: [:name, :year, :country, :price])
  end

end
