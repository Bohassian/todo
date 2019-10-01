class Task < ApplicationRecord
  belongs_to :user, inverse_of: :tasks

  has_many :list_items, inverse_of: :task

  validates :name, :user, presence: true
end
