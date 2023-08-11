class RemoveNutritionGoalReferenceFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :users, :nutrition_goal, foreign_key: true
  end
end
