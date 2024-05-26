FactoryBot.define do
  factory :category do
    title { Faker::Lorem.word.camelcase }
  end
end
