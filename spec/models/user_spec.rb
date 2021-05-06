require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    it '全ての情報が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5字以下だと登録できない' do
      @user.password = 'test1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが数字だけでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが英字だけでは登録できない' do
      @user.password = 'testsample'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordに全角が含まれていると登録できない' do
      @user.password = 'Asample1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameに英字or数字が含まれていると登録できない' do
      @user.first_name = 'サンプルsample１'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name は、かな、カナ、漢字の全角でお願い致します。')
    end

    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameに英字or数字が含まれていると登録できない' do
      @user.last_name = 'サンプルsample１'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name は、かな、カナ、漢字の全角でお願い致します。')
    end

    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'first_name_kanaはひらがなでは登録できない' do
      @user.first_name_kana = 'さんぷる'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana は、カタカナでお願い致します。')
    end

    it 'first_name_kanaは漢字では登録できない' do
      @user.first_name_kana = '課題'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana は、カタカナでお願い致します。')
    end

    it 'first_name_kanaは英字では登録できない' do
      @user.first_name_kana = 'sample'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana は、カタカナでお願い致します。')
    end

    it 'first_name_kanaは数字では登録できない' do
      @user.first_name_kana = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana は、カタカナでお願い致します。')
    end

    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'last_name_kanaはひらがなでは登録できない' do
      @user.last_name_kana = 'さんぷる'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana は、カタカナでお願い致します。')
    end

    it 'last_name_kanaは漢字では登録できない' do
      @user.last_name_kana = '課題'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana は、カタカナでお願い致します。')
    end

    it 'last_name_kanaは英字では登録できない' do
      @user.last_name_kana = 'sample'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana は、カタカナでお願い致します。')
    end

    it 'last_name_kanaは数字では登録できない' do
      @user.last_name_kana = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana は、カタカナでお願い致します。')
    end

    it 'birthdayがからでは登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
