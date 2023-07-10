require 'test_helper'

class WorkoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # Assuming you have a fixture or factory for a user
  end

  test "should create workout" do
    assert_difference('Workout.count', 1) do
      post workouts_path, params: {
        workout: {
          user_id: @user.id,
          start_at: DateTime.now - 2.hours,
          end_at: DateTime.now - 1.hour,
          exercises_attributes: [
            { name: 'benchpress', weight: 135, rep: 3, exercise_type_id: 298486374 },
            { name: 'squats', weight: 225, rep: 5, exercise_type_id: 980190962 }
          ]
        }
      }
    end
  
    assert_response :created
  end
  
end
