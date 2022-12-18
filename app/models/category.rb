class Category < ApplicationRecord
  # Relationships
  belongs_to :user
  has_many :entry_categories
  has_many :entries, through: :entry_categories

  # Validations
  validates :name, presence: true

  # Scopes
  scope :for_user, ->(user) { where(user: user) }
end
