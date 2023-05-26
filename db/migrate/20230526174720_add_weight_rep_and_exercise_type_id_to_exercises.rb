class AddWeightRepAndExerciseTypeIdToExercises < ActiveRecord::Migration[6.1]
  def change
    add_column :exercises, :weight, :float
    add_column :exercises, :rep, :integer
    add_column :exercises, :exercise_type_id, :integer
  end
end
