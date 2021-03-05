FactoryBot.define do
  factory :item do
    goods { 'ショールーム' }
    explanation            { '材木は外国製' }
    category_id            { 2 }
    status_id              { 2 }
    burden_id              { 2 }
    area_id                { 1 }
    day_id                 { 2 }
    price                  { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/hero.jpg'), filename: 'hero.jpg')
    end
  end
end
