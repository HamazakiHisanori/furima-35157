FactoryBot.define do
  factory :item do
    name { 'sample' }
    description { 'sample' }
    category_id { 2 }
    status_id { 2 }
    delivery_charge_id { 2 }
    prefecture_id { 2 }
    day_id { 2 }
    price { 10000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image_png.png'), filename: 'test_image_png.png')
    end
  end
end
