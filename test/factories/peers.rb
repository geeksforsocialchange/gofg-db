FactoryGirl.define do
  factory :peer do
    association :participant
    association :mentor
    peer_start "2017-04-04"
    peer_end "2017-04-04"
    notes "MyText"
  end
end
