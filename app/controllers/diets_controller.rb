class DietsController < ApplicationController
  before_action :set_diet, only: [:update, :destroy]

  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  def show
    if params[:date].present?
      find_by_date
    else
      @diet = Diet.find(params[:id])
      render json: @diet, include: { foods: { methods: :meal_type_name } }
    end
  end

  # PUT /diets/:id
  def update
    # @diet = Diet.find(params[:id])

    # # Clear existing food items associated with the diet
    # @diet.foods.destroy_all
    if @diet.update(diet_params)
      render json: @diet, include: { foods: { methods: :meal_type_name } }
    else
      render json: { errors: @diet.errors.full_messages }, status: :unprocessable_entity
    end
  end



  # # PUT /diets/:id
  # def update
  #   @diet = Diet.find(params[:id])

  #   # Extract the new list of food items from the request
  #   new_food_items = params[:diet][:foods_attributes]

  #   # Create a map of food item names to their attributes for faster lookup
  #   new_food_items_map = new_food_items.index_by { |food| food[:name] }

  #   # Iterate through the existing food items and update or delete as needed
  #   @diet.foods.each do |existing_food|
  #     if new_food_items_map.key?(existing_food.name)
  #       # Food item exists in the new list, update it
  #       new_attributes = new_food_items_map[existing_food.name]
  #       existing_food.update(new_attributes)
  #       new_food_items_map.delete(existing_food.name) # Remove from the map
  #     else
  #       # Food item doesn't exist in the new list, delete it
  #       existing_food.destroy
  #     end
  #   end

  #   # Create new food items for any remaining items in the new list
  #   new_food_items_map.each_value do |attributes|
  #     @diet.foods.create(attributes)
  #   end

  #   if @diet.save
  #     render json: @diet, include: { foods: { methods: :meal_type_name } }
  #   else
  #     render json: { errors: @diet.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

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

  def find_the_latest_diet
    user_id = params[:user_id]
    # Find the latest diet record for the user based on the taken_at attribute
    @diet = Diet.where(user_id: user_id).order(taken_at: :desc).first
  
    if @diet
      render json: @diet, include: { foods: { methods: :meal_type_name } }
    else
      render json: { diet: nil }
    end
  end

  private

  def set_diet
    @diet = current_user.diets.find(params[:id])
  end

  def diet_params
    params.require(:diet).permit(
      :user_id,
      :taken_at,
      foods_attributes: [:name, :calories, :protein, :fat, :carbohydrates, :meal_type_id, :serving_weight]
    )
  end

  def record_not_found
    render json: { error: 'Diet not found' }, status: :not_found
  end

  def find_by_date
    user_id = params[:user_id]
    date = Date.parse(params[:date]) rescue nil

    if date.nil?
      render json: { error: "Invalid date format" }, status: :unprocessable_entity
      return
    end

    # Convert the date to a Time object in your app's default time zone
    date_time = date.to_time.in_time_zone

    @diet = Diet.find_by(user_id: user_id, created_at: date_time.beginning_of_day..date_time.end_of_day)

    if @diet
      render json: @diet, include: { foods: { methods: :meal_type_name } }
    else
      render json: { diet: nil }
    end
  end
end
