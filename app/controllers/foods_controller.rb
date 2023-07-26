require 'net/http'
require 'json'

class FoodsController < ApplicationController
  def search
    search_param = params[:search_param]

    # Make the API request to the USDA API using an HTTP client library
    response = Net::HTTP.get_response(URI("https://api.nal.usda.gov/fdc/v1/foods/search?query=#{search_param}&api_key=#{ENV['FOOD_API_KEY']}&dataType=Survey%20(FNDDS)&pageSize=10"))

    if response.is_a?(Net::HTTPSuccess)
      # Process the response and create a simplified response object
      simplified_response = process_api_response(response.body)

      # Render the simplified response as JSON
      render json: simplified_response
    else
      # Handle API request errors
      render json: { error: "Failed to fetch data from the API" }, status: :internal_server_error
    end
  end

  private

  def process_api_response(response_body)
    parsed_response = JSON.parse(response_body)
    foods = parsed_response['foods']

    simplified_foods = foods.map do |food|
      {
        name: food['description'],
        calories: extract_nutrient_value(food, 'Energy'),
        protein: extract_nutrient_value(food, 'Protein'),
        fat: extract_nutrient_value(food, 'Total lipid (fat)'),
        carbohydrates: extract_nutrient_value(food, 'Carbohydrate, by difference')
      }
    end

    simplified_foods
  end

  def extract_nutrient_value(food, nutrient_name)
    nutrient = food['foodNutrients'].find { |nutrient| nutrient['nutrientName'] == nutrient_name }
    nutrient ? nutrient['value'] : 0
  end
end
