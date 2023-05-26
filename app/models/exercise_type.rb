class ExerciseType < ApplicationRecord
  attribute :name, :string
  attribute :muscle_group, :string
  validates :name, :muscle_group, presence: true
end
