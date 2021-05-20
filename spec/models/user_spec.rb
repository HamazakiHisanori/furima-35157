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
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end

    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end

    it '重複したemailでは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end

    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end

    it 'passwordが5字以下だと登録できない' do
      @user.password = 'test1'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは、半角英数字を含む6字以上でお願い致します')
    end

    it 'passwordが数字だけでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは、半角英数字を含む6字以上でお願い致します')
    end

    it 'passwordが英字だけでは登録できない' do
      @user.password = 'testsample'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは、半角英数字を含む6字以上でお願い致します')
    end

    it 'passwordに全角が含まれていると登録できない' do
      @user.password = 'Asample1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end

    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字を入力してください')
    end

    it 'first_nameに英字or数字が含まれていると登録できない' do
      @user.first_name = 'サンプルsample１'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字は、かな、カナ、漢字の全角でお願い致します')
    end

    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前を入力してください')
    end

    it 'last_nameに英字or数字が含まれていると登録できない' do
      @user.last_name = 'サンプルsample１'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は、かな、カナ、漢字の全角でお願い致します')
    end

    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字（フリガナ）を入力してください')
    end

    it 'first_name_kanaはひらがなでは登録できない' do
      @user.first_name_kana = 'さんぷる'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字（フリガナ）は、カタカナでお願い致します')
    end

    it 'first_name_kanaは漢字では登録できない' do
      @user.first_name_kana = '課題'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字（フリガナ）は、カタカナでお願い致します')
    end

    it 'first_name_kanaは英字では登録できない' do
      @user.first_name_kana = 'sample'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字（フリガナ）は、カタカナでお願い致します')
    end

    it 'first_name_kanaは数字では登録できない' do
      @user.first_name_kana = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字（フリガナ）は、カタカナでお願い致します')
    end

    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（フリガナ）を入力してください')
    end

    it 'last_name_kanaはひらがなでは登録できない' do
      @user.last_name_kana = 'さんぷる'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（フリガナ）は、カタカナでお願い致します')
    end

    it 'last_name_kanaは漢字では登録できない' do
      @user.last_name_kana = '課題'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（フリガナ）は、カタカナでお願い致します')
    end

    it 'last_name_kanaは英字では登録できない' do
      @user.last_name_kana = 'sample'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（フリガナ）は、カタカナでお願い致します')
    end

    it 'last_name_kanaは数字では登録できない' do
      @user.last_name_kana = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（フリガナ）は、カタカナでお願い致します')
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('生年月日を入力してください')
    end
  end
end
