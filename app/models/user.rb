class User < ApplicationRecord
  has_many :workouts
  enum preferred_unit_for_weight: { kg: 0, lbs: 1 }

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :height, numericality: { greater_than: 0 }, allow_nil: true
  validates :weight, numericality: { greater_than: 0 }, allow_nil: true
end
