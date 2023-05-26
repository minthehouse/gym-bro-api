require "test_helper"

class ExerciseTest < ActiveSupport::TestCase
  # def setup do
  # end
  test "requires presence of weight" do
    exercise = Exercise.new(weight: nil)
    assert_not exercise.valid?
    assert_includes exercise.errors[:weight], "can't be blank"
  end

  test "requires weight to be a numerical value" do
    exercise = Exercise.new(weight: 'hi')
    assert_not exercise.valid?
    assert_includes exercise.errors[:weight], "is not a number"
  end

  test "requires presense of rep" do
    exercise = Exercise.new(rep: nil)
    assert_not exercise.valid?
    assert_includes exercise.errors[:rep], "can't be blank"
  end

  test "requires rep to be an numerical value" do
    exercise = Exercise.new(rep: 'hi')
    assert_not exercise.valid?
    assert_includes exercise.errors[:rep], "is not a number"
  end

  test "requires workout association" do
    exercise = Exercise.new(workout: nil)
    assert_not exercise.valid?
    assert_includes exercise.errors[:workout], "must exist"
  end

  test "requires exercise_type association" do
    exercise = Exercise.new(exercise_type: nil)
    assert_not exercise.valid?
    assert_includes exercise.errors[:exercise_type], "must exist"
  end
end
