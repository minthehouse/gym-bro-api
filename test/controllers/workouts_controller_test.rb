require 'test_helper'

class WorkoutsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @workout = base_workouts(:one)
  end
  # def setup
  #   @user = users(:one)
  #   # @user = User.create!(first_name: "Hi", last_name: "Lee", email: "lee@example.com")
  #   # @exercise_base = YAML.load_file(Rails.root.join('test/fixtures/exercise_base.yml'))
  #   # @exercises = YAML.load_file(Rails.root.join('test/fixtures/exercises.yml'))
  # end

  test "should create workout" do
    debug
    # exercise_attributes = @exercise_base.merge(@exercises['squats'])

    # assert_difference('Workout.count') do
    #   post workouts_url, params: {
    #     workout: {
    #       user_id: @user.id,
    #       start_at: DateTime.now,
    #       end_at: DateTime.now + 1.hour,
    #       duration_in_minutes: 60,
    #       exercises_attributes: [exercise_attributes]
    #     }
    #   }, as: :json
    # end

    # assert_response :created
  end
end
