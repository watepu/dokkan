FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'test1@dic.com' }
    password { 'password' }
  end
end
