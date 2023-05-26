class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises

  attribute :start_at, :datetime
  attribute :end_at, :datetime
  attribute :duration_in_minutes, :integer

  validate :must_have_at_least_one_exercise

  private

  def must_have_at_least_one_exercise
    errors.add(:base, "Workout must have at least one exercise") if exercises.empty?
  end
end
