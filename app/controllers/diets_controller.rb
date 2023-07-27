class DietsController < ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # GET /diets/:id
  def show
    @diet = Diet.find(params[:id])
    render json: @diet, include: { foods: { methods: :meal_type_name } }
  end

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

  def find_by_date
    user_id = params[:user_id]
    date = Date.parse(params[:date]) rescue nil # Parse the date from the request params (adjust the date format if needed)

    if date.nil?
      render json: { error: "Invalid date format" }, status: :unprocessable_entity
      return
    end

    @diet = Diet.find_by(user_id: user_id, created_at: date.beginning_of_day..date.end_of_day)

    if @diet
      render json: @diet, include: { foods: { methods: :meal_type_name } }
    else
      render json: { diet: nil }
    end
  end

  def find_the_latest_diet
    user_id = params[:user_id]
    # Find the latest diet record for the user based on the taken_at attribute
    @diet = Diet.where(user_id: user_id).order(taken_at: :desc).first

    debugger
    if @diet
      render json: @diet, include: { foods: { methods: :meal_type_name } }
    else
      render json: { diet: nil }
    end
  end

  private

  def diet_params
    params.require(:diet).permit(:user_id, :taken_at, foods_attributes: [:name, :calories, :protein, :fat, :carbohydrates, :meal_type_id])
  end

  def record_not_found
    render json: { error: 'Diet not found' }, status: :not_found
  end
end
