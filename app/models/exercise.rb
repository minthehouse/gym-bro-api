class Exercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise_type

  validates :weight, presence: true, numericality: { float: true }
  validates :rep, presence: true, numericality: { only_integer: true }

  attribute :exercise_type_id, :integer
  attribute :set_number, :integer

  def exercise_type_name
    exercise_type.name
  end
end
