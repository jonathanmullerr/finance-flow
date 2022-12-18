class Entry < ApplicationRecord
  # Relationships
  belongs_to :user
  has_many :entry_categories
  has_many :categories, through: :entry_categories

  # Validations
  validates :amount, presence: true
  validates :type, presence: true, inclusion: { in: %w[Expense Incoming] }

  self.inheritance_column = :type

  # Scopes
  scope :for_user, ->(user) { where(user: user) }
end
