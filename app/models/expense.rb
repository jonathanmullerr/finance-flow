class Expense < Transaction
    validates :amount, presence: true
end
