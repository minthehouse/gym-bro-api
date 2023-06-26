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
    workout_params = params.require(:workout).permit(:start_at, :end_at, :duration_in_minutes, exercises_attributes: [:set_number, :weight_in_kg, :repetitions, :exercise_type_id, :exercise_name])
  
    exercises_params = workout_params[:exercises_attributes]
    workout_params[:exercises_attributes] = []
  
    exercises_params.each do |_key, exercise|
      workout_params[:exercises_attributes] << exercise
    end
  
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
    params.require(:workout).permit(:start_at, :end_at, :duration_in_minutes, exercises_attributes: [:set, :weight, :reps, :exercise_type_id, :exercise_name])
  end
  
end
