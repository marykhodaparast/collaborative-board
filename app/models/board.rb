class Board < ApplicationRecord
  has_many :pages, -> { order(:position) }, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
end
