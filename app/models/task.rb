class Task < ApplicationRecord
  belongs_to :user, inverse_of: :tasks

  validates :name, :user, presence: true
end
