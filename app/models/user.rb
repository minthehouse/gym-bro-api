# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :workouts

  def calculate_and_set_additional_attributes(params)
    # Perform additional calculations based on the provided parameters
    # Example: Calculate suggested nutrition values
    self.suggested_protein_amount = calculate_protein_amount(params)
    self.suggested_fat_amount = calculate_fat_amount(params)
    self.suggested_carb_amount = calculate_carb_amount(params)

    # Save the user with the calculated attributes
    save
  end

  private

  def calculate_protein_amount(params)
    # Implement the protein calculation logic based on the provided parameters
    # Example: Calculate protein amount based on goal, gender, age, etc.
    # Return the calculated protein amount
  end

  def calculate_fat_amount(params)
    # Implement the fat calculation logic based on the provided parameters
    # Example: Calculate fat amount based on goal, gender, age, etc.
    # Return the calculated fat amount
  end

  def calculate_carb_amount(params)
    # Implement the carb calculation logic based on the provided parameters
    # Example: Calculate carb amount based on goal, gender, age, etc.
    # Return the calculated carb amount
  end
end

