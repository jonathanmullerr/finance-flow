class Entry < ApplicationRecord
  validates :amount, presence: true
  has_many :entry_categories
  has_many :categories, through: :entry_categories
end
