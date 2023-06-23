class ExerciseType < ApplicationRecord
  attribute :name, :string
  attribute :muscle_group, :string, default: nil
  validates :name, presence: true
end
