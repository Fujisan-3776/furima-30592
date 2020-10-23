FactoryBot.define do
  factory :item do
    item_name {Faker::Lorem.sentence}
    item_describe {Faker::Lorem.sentence}
    category_id {Faker::Number.within(range: 1..10)}
    item_condition_id {Faker::Number.within(range: 1..6)}
    delivery_charge_id {Faker::Number.within(range: 1..2)}
    prefecture_id {Faker::Number.within(range: 1..47)}
    shipping_days_id {Faker::Number.within(range: 1..3)}
    price {Faker::Number.within(range: 300..9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
