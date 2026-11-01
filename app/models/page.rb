class Page < ApplicationRecord
  belongs_to :board

  has_many :drawings, dependent: :destroy

  validates :name, presence: true
  validates :position, presence: true,
                        numericality: { only_integer: true, greater_than: 0 }

  validates :position, uniqueness: { scope: :board_id }
end
