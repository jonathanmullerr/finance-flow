class Category < ApplicationRecord
  validates :name, presence: true

  has_many :entry_categories
  has_many :entries, through: :entry_categories
end
