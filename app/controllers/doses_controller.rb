class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  before_action :set_ingredient, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find_by(id: params[:cocktail_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find_by(id: params[:ingredient_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
