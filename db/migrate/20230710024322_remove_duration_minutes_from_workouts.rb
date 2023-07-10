class RemoveDurationMinutesFromWorkouts < ActiveRecord::Migration[7.0]
  def change
    remove_column :workouts, :duration_in_minutes, :integer
  end
end
