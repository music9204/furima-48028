FactoryBot.define do
  factory :item do
    name                   { 'test name' }
    description            { 'test description' }
    category_id            { 2 }
    condition_id           { 2 }
    shipping_fee_status_id { 2 }
    prefecture_id          { 2 }
    shipping_day_id        { 2 }
    price                  { 5000 }

    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('app/assets/images/furima-logo-color.png')),
        filename: 'furima-logo-color.png',
        content_type: 'image/png'
      )
    end
  end
end
