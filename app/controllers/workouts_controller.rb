class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :update, :destroy]

  # GET /workouts
  def index
    @workouts = Workout.all
    render json: @workouts
  end

  # GET /workouts/:id
  def show
    render json: @workout
  end

  # POST /workouts
  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      render json: @workout, status: :created
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workouts/:id
  def update
    if @workout.update(workout_params)
      render json: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  def destroy
    workout.destroy
    head :no_content
  end

  private 

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(
      :user_id,
      :start_at,
      :end_at,
      :duration_in_minutes,
      exercises_attributes: [:name, :weight, :rep, :exercise_type_id]
    )
  end
  
end
