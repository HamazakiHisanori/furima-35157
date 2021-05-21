require 'rails_helper'

def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe 'プレビュー機能', type: :system do
  before do
    @item = FactoryBot.create(:item)
  end

  it '出品時、商品画像を登録したらプレビューが表示される' do
    # ログイン
    basic_pass new_user_session_path
    fill_in 'email', with: @item.user.email
    fill_in 'password', with: @item.user.password
    find('input[name="commit').click
    expect(current_path).to eq(root_path)
    # 出品ページへ遷移
    visit new_item_path
    # 商品画像指定
    image_path = Rails.root.join('public/images/test_image_png.png')
    # 商品画像を選択する
    attach_file('item[image]', image_path, make_visible: true)
    # 画像が表示されているか確認
    expect(page).to have_selector('img')
  end
end
