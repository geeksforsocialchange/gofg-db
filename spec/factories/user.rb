FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'password'
    accepted_at DateTime.now
  end
end
