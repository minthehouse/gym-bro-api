class AddMuscleGroupToExerciseType < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercise_types, :muscle_group, foreign_key: true, optional: true
  end
end
