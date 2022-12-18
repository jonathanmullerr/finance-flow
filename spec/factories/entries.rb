FactoryBot.define do
  factory :entry_one, class: Entry do
    date { Date.today }
    type { "Expense" }
    amount { 100.00 }
    description { Faker::Lorem.sentence }
  end

  factory :entry_two, class: Entry do
    date { Date.today }
    type { "Expense" }
    amount { 100.00 }
    description { "Test Two" }
  end

  factory :entry_three, class: Entry do
    date { Date.today }
    type { "Incoming" }
    amount { 200.0 }
    description { "Test Three" }
  end
end
