FactoryBot.define do
  factory :transaction_one, class: Transaction do
    date { Date.today }
    transaction_type { "Expense" }
    amount { 150.50 }
    description { "Test One" }
  end

  factory :transaction_two, class: Transaction do
    date { Date.today }
    transaction_type { "Expense" }
    amount { 100.00 }
    description { "Test Two" }
  end

  factory :transaction_three, class: Transaction do
    date { Date.today }
    transaction_type { "Incoming" }
    amount { 200.0 }
    description { "Test Three" }
  end
end
