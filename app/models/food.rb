class Food < ApplicationRecord
  belongs_to :diet
  belongs_to :meal_type

  def meal_type_name
    meal_type.display_name
  end
end
