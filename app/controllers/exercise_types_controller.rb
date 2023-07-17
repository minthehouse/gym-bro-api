class ExerciseTypesController < ApplicationController
  def index
    @exercise_types = ExerciseType.all
    render json: @exercise_types
  end

  def search
    search_param = params[:search_param]
    @exercise_types = ExerciseType.where('LOWER(name) LIKE ?', "%#{search_param.downcase}%")
    render json: @exercise_types
  end
end
