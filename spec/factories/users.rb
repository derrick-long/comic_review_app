FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    first_name "Guy"
    last_name "Person"
    password "password"
    password_confirmation "password"
    sequence(:id)
  end
end
