FactoryBot.define do
  factory :store do
    codename {Faker::Company.name}
    address {Faker::Address.street_address}
    phone {'(541) 754-3010'}
  end
end