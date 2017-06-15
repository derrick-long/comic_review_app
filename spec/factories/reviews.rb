FactoryGirl.define do
  factory :review do
    rating 5
    content "This is the content"

    association :user, factory: :user
    association :comic, factory: :comic
  end
end
