FactoryBot.define do
  factory :category, class: Category do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    image { Faker::LoremPixel.image }
  end
end
