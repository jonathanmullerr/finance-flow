class Category < ApplicationRecord
  default_scope { where(user_id: User.current_id) }

  # Relationships
  belongs_to :user
  has_many :entry_categories
  has_many :entries, through: :entry_categories

  # Validations
  validates :name, presence: true
end
