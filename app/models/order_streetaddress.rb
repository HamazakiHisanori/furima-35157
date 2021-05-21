class OrderStreetaddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は、3桁ハイフン(-)4桁で入力してください', allow_blank: true }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は、ハイフン(-)なし10桁、又は11桁でお願い致します', allow_blank: true }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                         building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
