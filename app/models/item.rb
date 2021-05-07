class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_charge_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :day_id, numericality: { other_than: 1 }
    validates :price
    validates :user
  end
belongs_to :user
has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :status
belongs_to :delivery_charge
belongs_to :prefecture
belongs_to :day
end
