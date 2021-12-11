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
end

describe 'ユーザログインのテスト' do
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
end

describe 'マイページのテスト' do
  before do
    visit users_my_page_path
  end

  context '表示内容の確認' do
    it 'URLが正しい' do
      expect(current_path).to eq '/users/my_page'
    end
    it '「マイページ」と表示される' do
      expect(page).to have_content 'マイページ'
    end
    it '「ユーザ名」が表示される' do
      expect(page).to have_content 'user[name]'
    end
    it '「ユーザ写真」が表示される' do
      expect(page).to have_content 'user[profile_image_id]'
    end
    it 'ユーザ編集ボタンが表示される' do
      expect(page).to have_button 'プロフィールを編集'
    end
    it 'フォロワーボタンが表示される' do
      expect(page).to have_button 'フォロワー'
    end
    it 'フォロー中ボタンが表示される' do
      expect(page).to have_button 'フォロー中'
    end
  end
end