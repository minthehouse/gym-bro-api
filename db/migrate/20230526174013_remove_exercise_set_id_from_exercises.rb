class RemoveExerciseSetIdFromExercises < ActiveRecord::Migration[7.0]
  def change
    remove_column :exercises, :exercise_set_id, :integer
  end
end
