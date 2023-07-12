class Diet < ApplicationRecord
  belongs_to :user
  has_many :foods  # Add inverse_of to maintain the association

  validate :must_have_at_least_one_food

  accepts_nested_attributes_for :foods

  private

  def must_have_at_least_one_food
    errors.add(:base, "Diet must have at least one food") if foods.blank? || foods.all?(&:marked_for_destruction?)
  end
end
