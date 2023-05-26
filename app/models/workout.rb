class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises

  attribute :start_at, :datetime
  attribute :end_at, :datetime
  attribute :duration_in_minutes, :integer

  validate :must_have_at_least_one_exercise
  validate :valid_start_at?
  validate :valid_end_at?

  private

  def must_have_at_least_one_exercise
    errors.add(:base, "Workout must have at least one exercise") if exercises.empty?
  end

  def valid_start_at?
    errors.add(:start_at, 'Cannot be in the future') if start_at.present? && start_at > DateTime.now
  end

  def valid_end_at?
    errors.add(:end_at, 'Cannot be in the future') if end_at.present? && end_at > DateTime.now
    errors.add(:end_at, 'Cannot be before start_at') if end_at.present? && start_at.present? && end_at < start_at
  end
end
