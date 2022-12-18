FactoryBot.define do
  factory :expense, class: Expense do
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    type { "Expense" }
    amount { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.sentence }
  end
end
