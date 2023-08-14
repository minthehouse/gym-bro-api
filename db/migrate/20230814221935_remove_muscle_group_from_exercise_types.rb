class RemoveMuscleGroupFromExerciseTypes < ActiveRecord::Migration[7.0]
  def change
    remove_column :exercise_types, :muscle_group, :string
  end
end
