class Task < ApplicationRecord
  validates :title, presence: true, length: { in: 1..25 }
  validates :description, length: { maximum: 100 }
end
