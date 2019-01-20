require 'rails_helper'

RSpec.describe User, type: :model do

  it 'name,email,passwordがあればOK' do
    user_a = FactoryBot.create(:user)
    expect(user_a).to be_valid
  end

  it 'emailがなければエラー' do
    # user_b = FactoryBot.create(:user, email: '')
    user_b = User.new(email: nil)
    user_b.valid?
    expect(user_b.errors[:email]).to include("を入力してください")
  end

  it 'emailが重複しているとエラー' do
    user_a = FactoryBot.create(:user)
    user_c = User.new(email: 'test3@example.com')
    user_c.valid?
    expect(user_c.errors[:email]).to include("はすでに存在します")
  end
end
