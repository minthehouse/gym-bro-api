require "test_helper"

class ExerciseTest < ActiveSupport::TestCase
  # def setup do
  # end
  test "requires presence of weight" do
    exercise = Exercise.new(weight: nil)
    assert_not exercise.valid?
    debug
    assert_includes exercise.errors[:weight], "can't be blank"
  end
end
