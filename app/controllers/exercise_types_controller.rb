class ExerciseTypesController < ApplicationController
  before_action :set_exercise_type, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
    @exercise_types = ExerciseType.all
    render json: @exercise_types
  end

  def create
    @exercise_type =exercise_type.new(exercise_type_params)

    if @exercise_type.save
      render json: @exercise_type, status: :created
    else
      render json: @exercise_type.errors, status: :unprocessable_entity
    end
  end

  def show
    @exercise_type =exercise_type.find(params[:id])
    render json: @exercise_type
  end

  def destroy
   exercise_type.destroy
    head :no_content
  end

  private

  def set_exercise_type
    @exercise_type = ExerciseType.find(params[:id])
  end

  def exercise_type_params
    params.require(:exercise_type).permit(:first_name, :last_name, :email, :preferred_unit_for_weight, :height, :weight)
  end

end
