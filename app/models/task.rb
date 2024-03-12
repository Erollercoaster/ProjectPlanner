class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  attribute :completed, :boolean, default: false
end