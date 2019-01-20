require 'rails_helper'

RSpec.describe User, type: :model do

  it 'name,email,passwordがあればOK' do
    user_a = FactoryBot.create(:user)
    expect(user_a).to be_valid
  end
end
