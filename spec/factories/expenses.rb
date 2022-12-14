FactoryBot.define do
  factory :expense_one, class: Expense do
    date { Date.today }
    type { "Expense" }
    amount { 150.50 }
    description { "Test One" }
  end

  factory :expense_two, class: Expense do
    date { Date.today }
    type { "Expense" }
    amount { 100.00 }
    description { "Test Two" }
  end

  factory :expense_three, class: Expense do
    date { Date.today }
    type { "Expense" }
    amount { 200.0 }
    description { "Test Three" }
  end
end
