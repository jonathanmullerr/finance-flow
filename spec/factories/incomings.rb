FactoryBot.define do
  factory :incoming, class: Incoming do
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    type { "Incoming" }
    amount { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Lorem.sentence }
  end
end
