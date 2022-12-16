class Entry < ApplicationRecord
  # Relationships
  belongs_to :user
  has_many :entry_categories
  has_many :categories, through: :entry_categories

  # Validations
  validates :amount, presence: true
  
 
  self.inheritance_column = :type
end
