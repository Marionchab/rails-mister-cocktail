class IngredientsController < ApplicationController
  def new
    @cocktail = Coktail.find(params[:cocktail_id])
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient.save
    redirect_to cocktail_path(@cocktail)
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
