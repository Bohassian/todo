class Task < ApplicationRecord
  belongs_to :user, inverse_of: :tasks

  has_many :list_items, inverse_of: :task, dependent: :destroy

  validates :name, :user, presence: true
end
