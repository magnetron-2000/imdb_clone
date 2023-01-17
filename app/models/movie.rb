class Movie < ApplicationRecord
  CATEGORIES = %w[action adventure comedy drama fantasy horror musicals mystery romance science_fiction sports thriller western ]
  validates :title, presence: true, length: {in: 3..80}
  validates :text, presence: true, length: {in: 3..1000}
  validates :rating, inclusion: { in: 0..10, message: "must be in 0-10 range " }, numericality: { only_integer: true }
  validates :category, presence: true, inclusion: { in: CATEGORIES, message: "not an existing category" }
end
