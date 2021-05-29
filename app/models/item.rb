class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many_attached :images

  with_options presence: true do
    validates :images
    validates :name
    validates :description
    validates :tagname
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'は300円以上9999999円以下でお願い致します', allow_blank: true }
    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :category_id
      validates :status_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :day_id
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :day
end
