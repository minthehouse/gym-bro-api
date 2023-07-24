class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :workout_id, :created_at, :updated_at, :weight, :rep, :exercise_type_id, :set_number, :exercise_type_name

  def exercise_type_name
    object.exercise_type.name
  end
end