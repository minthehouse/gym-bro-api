class ExerciseType < ApplicationRecord
  belongs_to :muscle_group
  attribute :name, :string
  validates :name, presence: true
end
