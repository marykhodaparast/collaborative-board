class Drawing < ApplicationRecord
  belongs_to :page

  validates :nickname, presence: true, length: { maximum: 30 }
  validates :tool, presence: true
  validates :color, presence: true
  validates :stroke_width, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validates :data, presence: true
end