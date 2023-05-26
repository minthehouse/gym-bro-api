require "test_helper"

class ExerciseTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "requires name to be present" do
    exercise_type = ExerciseType.new(name: nil)

    assert_not exercise_type.valid?
    assert_includes exercise_type.errors[:name], "can't be blank"
  end

  test "requires muscle_group to be present" do
    exercise_type = ExerciseType.new(muscle_group: nil)

    assert_not exercise_type.valid?
    assert_includes exercise_type.errors[:muscle_group], "can't be blank"
  end

  test "requires name to be string" do
    exercise_type = ExerciseType.new(name: 1)

    assert_not exercise_type.valid?
    assert_includes exercise_type.errors[:name], "can't be blank"
  end

  test "requires muscle_group to be string" do
    exercise_type = ExerciseType.new(muscle_group: nil)

    assert_not exercise_type.valid?
    assert_includes exercise_type.errors[:muscle_group], "can't be blank"
  end
end
