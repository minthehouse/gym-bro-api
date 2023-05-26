class AddExerciseSetToExercises < ActiveRecord::Migration[7.0]
  def change
    add_reference :exercises, :exercise_set, foreign_key: true
  end
end
