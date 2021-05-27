FactoryBot.define do
  factory :item, class: Item do
    name { Faker::TvShows::Suits.character }
    description { Faker::GreekPhilosophers.quote }
    unit_price { Faker::Number.between(from: 3000, to: 100_000) }

    merchant
  end
end
