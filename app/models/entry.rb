class Entry < ApplicationRecord
  validates :amount, presence: true
end
