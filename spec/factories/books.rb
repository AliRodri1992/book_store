FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    year { Faker::Number.between(from: 1900, to: 2030) }
  end
end
