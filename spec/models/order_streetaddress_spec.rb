require 'rails_helper'

RSpec.describe OrderStreetaddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_streetaddress = FactoryBot.build(:order_streetaddress, user_id: @user.id, item_id: @item.id)
    sleep 0.05
  end

  describe '商品購入' do
    context '購入ができる場合' do
      it '全ての情報が正しく入力されていたら購入できる' do
        expect(@order_streetaddress).to be_valid
      end

      it 'building_nameが空でも購入できる' do
        @order_streetaddress.building_name = ''
        @order_streetaddress.valid?
        expect(@order_streetaddress).to be_valid
      end
    end

    context '購入ができない場合' do
      it 'postal_codeが空だと購入できない' do
        @order_streetaddress.postal_code = ''
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフン(-)が入ってないと購入できない' do
        @order_streetaddress.postal_code = '1111111'
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include('Postal code 3桁ハイフン(-)4桁で入力してください')
      end

      it 'postal_codeが半角数字でないと購入できない' do
        @order_streetaddress.postal_code = '１１１-１１１１'
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include('Postal code 3桁ハイフン(-)4桁で入力してください')
      end

      it 'postal_codeが3桁ハイフン(-)4桁でないと購入できない' do
        @order_streetaddress.postal_code = '1111-111'
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include('Postal code 3桁ハイフン(-)4桁で入力してください')
      end

      it 'prefecture_idが選択されていないと購入できない' do
        @order_streetaddress.prefecture_id = ''
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1だと購入できない' do
        @order_streetaddress.prefecture_id = 1
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include('Prefecture 選択してください')
      end

      it 'cityが空だと購入できない' do
        @order_streetaddress.city = ''
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと購入できない' do
        @order_streetaddress.address = ''
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @order_streetaddress.phone_number = ''
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが全角数字だと購入できない' do
        @order_streetaddress.phone_number = '０９０００００００００'
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include('Phone number ハイフン(-)なし10桁、又は11桁でお願い致します')
      end

      it 'phone_numberにハイフン(-)が入っていると購入できない' do
        @order_streetaddress.phone_number = '090-00000000'
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include('Phone number ハイフン(-)なし10桁、又は11桁でお願い致します')
      end

      it 'phone_numberが12桁以上だと購入できない' do
        @order_streetaddress.phone_number = '090000000000'
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include('Phone number ハイフン(-)なし10桁、又は11桁でお願い致します')
      end

      it 'phone_numberが9桁以下だと購入できない' do
        @order_streetaddress.phone_number = '090000000'
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include('Phone number ハイフン(-)なし10桁、又は11桁でお願い致します')
      end

      it 'phone_numberが英数混合だと購入できない' do
        @order_streetaddress.phone_number = '090aaaaaaaa'
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include('Phone number ハイフン(-)なし10桁、又は11桁でお願い致します')
      end

      it 'tokenが空だと購入できない' do
        @order_streetaddress.token = ''
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include("Token can't be blank")
      end

      it 'userと紐付いていないと購入できない' do
        @order_streetaddress.user_id = nil
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include("User can't be blank")
      end

      it 'itemと紐付いていないと購入できない' do
        @order_streetaddress.item_id = nil
        @order_streetaddress.valid?
        expect(@order_streetaddress.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
