class Pet < ApplicationRecord
  belongs_to :owner
  validates :name, :pet_type, :monthly_cost, presence: true
  validates :monthly_cost, numericality: { greater_than_or_equal_to: 0 }
end
