class DietsController < ApplicationController
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
