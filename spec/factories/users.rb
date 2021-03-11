FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.first_name}
    email                 {Faker::Internet.safe_email}
    password              {'pass12'}
    password_confirmation {password}
    first_name_kanji      {'太郎'}
    first_name_kana       {'タナカ'}
    last_name_kanji       {'田中'}
    last_name_kana        {'タロウ'}
    birthday              {Faker::Date.between(from: 100.years.ago, to: Date.today)}
  end
end