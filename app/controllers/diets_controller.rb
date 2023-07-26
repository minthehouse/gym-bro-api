class DietsController < ApplicationController
  # GET /diets
  def index
    @diets = Diet.where(user_id: params[:user_id])
    # render json: @diets, include: :foods
    render json: @diets, include: { foods: { methods: :meal_type_name } }
  end

  def create
    diet = Diet.new(diet_params)

    if diet.save
      render json: diet, status: :created
    else
      render json: { errors: diet.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def diet_params
    params.require(:diet).permit(:user_id, foods_attributes: [:name, :calories, :protein, :fat, :carbohydrates, :meal_type_id])
  end
end
