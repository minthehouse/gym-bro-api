class ExerciseType < ApplicationRecord
  belongs_to :muscle_groups
  attribute :name, :string
  attribute :muscle_group, :string, default: nil
  validates :name, presence: true
end
