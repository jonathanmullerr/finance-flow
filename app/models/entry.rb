class Entry < ApplicationRecord
  default_scope { where(user_id: User.current_id) }

  # Relationships
  belongs_to :user
  has_many :entry_categories
  has_many :categories, through: :entry_categories

  # Validations
  validates :amount, presence: true
  validates :type, presence: true, inclusion: { in: %w[Expense Incoming] }

  self.inheritance_column = :type

  def self.by_month(month, year)
    where('extract(month from date) = ? AND extract(year from date) = ?', month, year)
  end

  def self.by_year(year)
    where('extract(year from date) = ?', year)
  end

  def self.by_category(category)
    joins(:categories).where(categories: { id: category })
  end

  def self.by_categories(categories)
    joins(:categories).where(categories: { id: categories })
  end

  def self.by_date_range(start_date, end_date)
    where(date: start_date..end_date)
  end
end
