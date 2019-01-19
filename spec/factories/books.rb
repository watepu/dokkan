FactoryBot.define do
  factory :book do
    title {'BOOK1'}
    headline {'ruby'}
    content {'RSpecについて'}
    user
  end
end
