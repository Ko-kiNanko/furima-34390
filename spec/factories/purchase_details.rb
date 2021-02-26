FactoryBot.define do
  factory :purchase_detail do
    transient do
    end
    post_number { '123-4567'}
    prefecture_id { Faker::Number.between(from: 2, to: 47) }
    municipality { '大阪府大阪市住之江区' }
    address { '1-1' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
