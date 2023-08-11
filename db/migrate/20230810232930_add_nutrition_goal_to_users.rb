class AddNutritionGoalToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :nutrition_goal, foreign_key: true
  end
end
