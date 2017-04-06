FactoryGirl.define do
  factory :membership do
    person
    organisation
    member_start "2017-04-06"
    member_end "2017-04-06"
    notes "MyText"
  end
end
