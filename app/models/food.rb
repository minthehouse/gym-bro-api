class Food < ApplicationRecord
  belongs_to :diet
  belongs_to :meal_type

end
