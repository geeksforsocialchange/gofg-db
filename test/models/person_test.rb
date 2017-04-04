require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @person = create(:person)
  end

  test "person validations" do
    # Do properly when shoulda works
    @person.first_name = nil
    assert_not @person.save
  end
end
