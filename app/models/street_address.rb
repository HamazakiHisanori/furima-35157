class StreetAddress < ApplicationRecord
with_options presence: true do
  validates :postal_code
  validates :prefecture_id, numericality: {other_than: 0, message: "選択してください"}
  validates :city
  validates :address
  validates :phone_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフン(-)を入れて入力してください"}
end
  validates :building_name

belongs_to :order

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :prefecture

end
