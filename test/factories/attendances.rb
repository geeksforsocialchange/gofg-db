FactoryGirl.define do
  factory :attendance do
    person
    event
    notes "MyText"
  end
end
