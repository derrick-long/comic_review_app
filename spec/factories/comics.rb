FactoryGirl.define do
  factory :comic do
    sequence(:title) {|n| "A Book #{n}"}
    author "The Dude Man"
    artist "Another Guy"
    user_id 1
  end
end
