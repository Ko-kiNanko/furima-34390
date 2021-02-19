FactoryBot.define do
  factory :item do
    transient do
  end
    item_name {Faker::Name.name}
    price { 3000 }
    information { Faker::Lorem.sentence }
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    delivery_fee_id { Faker::Number.between(from: 2, to: 3) }
    shipping_day_id { Faker::Number.between(from: 2, to: 4) }
    category_id { Faker::Number.between(from: 2, to: 10) }
    item_status_id { Faker::Number.between(from: 2, to: 7) }
    association :user

    after(:build) do |view|
      view.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
