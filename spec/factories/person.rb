FactoryGirl.define do
  factory :participant1, class: 'Participant' do
    first_name 'John'
    last_name  'Smith'
    identifier '1801'
  end

  factory :participant2, class: 'Participant' do
    first_name 'Sally'
    last_name  'Rider'
    identifier '1945'
  end

  factory :participant3, class: 'Participant' do
    first_name 'Sasha'
    last_name  'Smith'
    identifier '1380'
  end
end
