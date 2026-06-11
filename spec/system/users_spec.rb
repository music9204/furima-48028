require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  it 'ユーザー新規登録に成功する' do
    visit new_user_registration_path

    fill_in 'nickname', with: @user.nickname
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    fill_in 'password-confirmation', with: @user.password_confirmation
    fill_in 'last-name', with: @user.last_name
    fill_in 'first-name', with: @user.first_name
    fill_in 'last-name-kana', with: @user.last_name_kana
    fill_in 'first-name-kana', with: @user.first_name_kana

    select '1990', from: 'user_birthday_1i' # 연도
    select '1', from: 'user_birthday_2i'    # 월
    select '1', from: 'user_birthday_3i'    # 일

    click_on '会員登録'

    puts page.find('.error-alert').text if page.has_css?('.error-alert')

    # 결과 확인
    expect(current_path).to eq(root_path)
  end
end
