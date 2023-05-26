require "test_helper"

class WorkoutTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # test "requires start_at" do
  #   workout = Workout.new(start_at: nil)

  #   assert_not workout.valid?
  #   assert_includes workout.errors[:start_at], "can't be blank"
  # end

  # test "requires end_at" do
  #   workout = Workout.new(end_at: nil)

  #   assert_not workout.valid?
  #   assert_includes workout.errors[:end_at], "can't be blank"
  # end

  test "requires start_at to not be in the future" do
    workout = Workout.new(start_at: 1.day.from_now)

    assert_not workout.valid?
    assert_includes workout.errors[:start_at], "Cannot be in the future"
  end

  test "requires end_at to not be in earlier than start_at" do
    workout = Workout.new(start_at: 1.day.ago, end_at: 2.day.ago)

    assert_not workout.valid?
    assert_includes workout.errors[:end_at], "Cannot be before start_at"
  end
end
