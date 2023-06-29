class RemoveExerciseTypeFromMuscleGroup < ActiveRecord::Migration[7.0]
  def change
    remove_reference :muscle_groups, :exercise_type, null: false, foreign_key: true
  end
end
