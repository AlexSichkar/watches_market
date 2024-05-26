FactoryBot.define do
  factory :watch do
    name { Faker::Lorem.word.camelcase }
    description { Faker::Lorem.sentence(word_count: 5)}
    category_id { rand(1..5)}
    price { rand(50..1000) }
    view_url { "http://localhost:3000/watches/photo/#{category_id}#{rand(1..5)}.html" }

  end
end
