class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :update, :destroy]

  # GET /workouts
  def index
    @workouts = Workout.where(user_id: params[:user_id])
    render json: @workouts, include: { exercises: { methods: :exercise_type_name } }
  end
  
  # GET /workouts/:id
  def show
    render json: @workout
  end

  # POST /workouts

  def create
    workout_params = params.require(:workout).permit(:user_id, :start_at, :end_at, exercises_attributes: [:set_number, :weight, :rep, :exercise_type_id])
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

  # GET /users/:user_id/workouts/:id/previous_workout
  def previous_workout
    current_workout = current_user.workouts.find(params[:id])
    previous_workout = current_user.workouts.where("id < ?", current_workout.id).order(id: :desc).first

    if previous_workout
      custom_response = build_custom_response(previous_workout)
      render json: custom_response
    else
      render json: { message: "No previous workout found." }, status: :not_found
    end
  end

  private 

  def set_workout
    @workout = current_user.workouts.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:user_id, :start_at, :end_at, exercises_attributes: [:set_number, :weight, :rep, :exercise_type_id])
  end

  def build_custom_response(workout)
    custom_response = {
      id: workout.id,
      start_at: workout.start_at,
      end_at: workout.end_at,
      exercises: ActiveModelSerializers::SerializableResource.new(workout.exercises, each_serializer: ExerciseSerializer).as_json
    }

    custom_response
  end
  
end
