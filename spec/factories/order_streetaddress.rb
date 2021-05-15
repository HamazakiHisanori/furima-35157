FactoryBot.define do
  factory :order_streetaddress do
    token { 'tok_0000000000000000000000000000' }
    postal_code { '111-1111' }
    prefecture_id { 2 }
    city { 'A市' }
    address { 'B番地' }
    building_name { '空でも良い' }
    phone_number { '09000000000' }
  end
end
