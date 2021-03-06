FactoryBot.define do
  factory :order_delivery do
    token {"BB0AyqSm+rJje4PK+49Q/tD5jL82C/m/NVx8sL9ag3j6coMramRKfkYCLu6Qd+0J3spZWmQwOc45NQg7a51S6g=="}
    postal_code {"123-4567"}
    prefecture_id {Faker::Number.within(range: 1..47)}
    city {Faker::Address.city}
    house_number {Faker::Lorem.sentence}
    building_name {Faker::Lorem.sentence}
    phone_number {Faker::Number.within(range: 10000000000..99999999999)}
  end
end
