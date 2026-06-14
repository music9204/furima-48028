FactoryBot.define do
  factory :comment do
    text { 'テスト用のコメントです。' }
    association :user
    association :item
  end
end
