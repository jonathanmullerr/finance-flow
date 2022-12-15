FactoryBot.define do
  factory :entry_one, class: Entry do
    date { Date.today }
    transaction_type { "Expense" }
    amount { 150.50 }
    description { "Test One" }
  end

  factory :entry_two, class: Entry do
    date { Date.today }
    transaction_type { "Expense" }
    amount { 100.00 }
    description { "Test Two" }
  end

  factory :entry_three, class: Entry do
    date { Date.today }
    transaction_type { "Incoming" }
    amount { 200.0 }
    description { "Test Three" }
  end
end
