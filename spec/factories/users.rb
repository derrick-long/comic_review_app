FactoryGirl.define do
  factory :user do
    after(:build)   { |u| u.skip_confirmation_notification! }
    after(:create)  { |u| u.confirm }
    sequence(:email) {|n| "person#{n}@example.com" }
    first_name "Guy"
    last_name "Person"
    password "password"
    password_confirmation "password"
  end
end
