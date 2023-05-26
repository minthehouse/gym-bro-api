class AddIndexToExerciseTypeIdInExercises < ActiveRecord::Migration[7.0]
  def change
    add_index :exercises, :exercise_type_id
  end
end
