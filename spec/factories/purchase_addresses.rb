FactoryBot.define do
  factory :purchase_address do
    post_number   { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    house_number  { Faker::Address.street_address }
    building_name { Faker::Address.building_number }
    phone_number  { Faker::Number.leading_zero_number(digits: 11) }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
