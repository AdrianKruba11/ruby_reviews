class Movie < ApplicationRecord
  validates :title, :author, :release_year, :category, :rating, presence: true
  validates :release_year, numericality: { only_integer: true, greater_than: 1800, less_than_or_equal_to: Date.current.year }
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
  validates :status, inclusion: { in: [true, false] }
  has_many :reviews, dependent: :destroy  # Film może mieć wiele recenzji
end
