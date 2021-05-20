require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品' do
    it '全ての情報が正しく入力されていれば出品できる' do
      expect(@item).to be_valid
    end

    it 'imageが空だと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('出品画像を入力してください')
    end

    it 'nameが空だと出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('商品名を入力してください')
    end

    it 'descriptionが空だと出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の説明を入力してください')
    end

    it 'category_idが1以外でないと出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
    end

    it 'status_idが1以外でないと出品できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を選択してください')
    end

    it 'delivery_charge_idが1以外でないと出品できない' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料負担を選択してください')
    end

    it 'prefecture_idが1以外でないと出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
    end

    it 'day_idが1以外でないと出品できない' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
    end

    it 'priceが空だと出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格を入力してください')
    end

    it 'priceが300未満だと出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は300円以上9999999円以下でお願い致します')
    end

    it 'priceが10000000以上だと出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は300円以上9999999円以下でお願い致します')
    end

    it 'priceが全角数字では出品できない' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は300円以上9999999円以下でお願い致します')
    end

    it 'priceが半角英字では出品できない' do
      @item.price = 'sample'
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は300円以上9999999円以下でお願い致します')
    end

    it 'priceが半角英数字混合では出品できない' do
      @item.price = 'sample1000'
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は300円以上9999999円以下でお願い致します')
    end

    it 'userが紐付いていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Userを入力してください')
    end
  end
end
