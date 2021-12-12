# frozen_string_literal: true

require 'rails_helper'

describe 'トップ画面のテスト' do
  before do
    visit root_path
  end

  context '表示内容の確認' do
    it 'URLが正しい' do
      expect(current_path).to eq '/'
    end
    it '「BouBag」と表示される' do
      expect(page).to have_content 'BouBag'
    end
  end
end

describe 'ユーザ新規登録のテスト' do
  before do
    visit new_user_registration_path
  end

  context '表示内容の確認' do
    it 'URLが正しい' do
      expect(current_path).to eq '/users/sign_up'
    end
    it '「新規登録」と表示される' do
      expect(page).to have_content '新規登録'
    end
    it 'nameフォームが表示される' do
      expect(page).to have_field 'user[name]'
    end
    it 'emailフォームが表示される' do
      expect(page).to have_field 'user[email]'
    end
    it 'passwordフォームが表示される' do
      expect(page).to have_field 'user[password]'
    end
    it 'password_confirmationフォームが表示される' do
      expect(page).to have_field 'user[password_confirmation]'
    end
    it '登録ボタンが表示される' do
      expect(page).to have_button '登録'
    end
  end

  context '新規登録成功のテスト' do
    before do
      fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
      fill_in 'user[email]', with: Faker::Internet.email
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
    end

    it '正しく新規登録される' do
      expect { click_button '登録' }.to change(User.all, :count).by(1)
    end
    it '新規登録後のリダイレクト先が、新規登録できたユーザの詳細画面になっている' do
      click_button '登録'
      expect(current_path).to eq '/users/my_page'
    end
  end
end

describe 'ユーザログインのテスト' do
  let(:user) { create(:user) }

  before do
    visit new_user_session_path
  end

  context '表示内容の確認' do
    it 'URLが正しい' do
      expect(current_path).to eq '/users/sign_in'
    end
    it '「ログイン」と表示される' do
      expect(page).to have_content 'ログイン'
    end
    it 'emailフォームが表示される' do
      expect(page).to have_field 'user[email]'
    end
    it 'passwordフォームが表示される' do
      expect(page).to have_field 'user[password]'
    end
    it 'ログインボタンが表示される' do
      expect(page).to have_button 'ログイン'
    end
  end

  context 'ログイン成功のテスト' do
    before do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    it 'ログイン後のリダイレクト先が、マイページになっている' do
      expect(current_path).to eq '/users/my_page'
    end
  end

  context 'ログイン失敗のテスト' do
    before do
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      click_button 'ログイン'
    end

    it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
      expect(current_path).to eq '/users/sign_in'
    end
  end

end