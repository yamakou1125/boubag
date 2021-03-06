# frozen_string_literal: true

require 'rails_helper'

describe 'モデルのテスト' do
  it "有効な新規登録の場合は保存されるか" do
    expect(FactoryBot.build(:user)).to be_valid
  end
end

describe 'バリデーションのテスト' do
  subject { user.valid? }
  let(:user) { build(:user) }

  context 'nameカラム' do
    it '空欄でないこと' do
      user.name = ''
      is_expected.to eq false
    end
  end
end