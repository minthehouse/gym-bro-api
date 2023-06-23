class Exercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise_type

  validates :weight, presence: true, numericality: { float: true }
  validates :rep, presence: true, numericality: { only_integer: true }

  attribute :exercise_type_id, :integer
end
