class AddDateAndDurationToWorkouts < ActiveRecord::Migration[7.0]
  def change
    add_column :workouts, :start_at, :datetime
    add_column :workouts, :end_at, :datetime
    add_column :workouts, :duration_in_minutes, :integer
  end
end
