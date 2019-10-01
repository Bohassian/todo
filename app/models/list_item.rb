class ListItem < ApplicationRecord
  belongs_to :task, inverse_of: :list_items

  validates :task, :description, :priority, presence: true
  validates :priority, numericality: { only_integer: true, greater_than: 0 }
  validates :complete, inclusion: { in: [true, false] }

  default_scope { order(priority: :asc) }
end
