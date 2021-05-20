class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password,
              format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/, message: 'は、半角英数字を含む6字以上でお願い致します', allow_blank: true }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は、かな、カナ、漢字の全角でお願い致します', allow_blank: true }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は、かな、カナ、漢字の全角でお願い致します', allow_blank: true }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は、カタカナでお願い致します', allow_blank: true }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'は、カタカナでお願い致します', allow_blank: true }
    validates :birthday
  end
  has_many :items
  has_many :orders
end
