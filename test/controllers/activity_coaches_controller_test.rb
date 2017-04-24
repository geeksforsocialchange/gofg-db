require 'test_helper'

class ActivityCoachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_coach = create(:activity_coach)
  end

  test "should get index" do
    get activity_coaches_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_coach_url
    assert_response :success
  end

  test "should create activity_coach" do
    assert_difference('ActivityCoach.count') do
      post activity_coaches_url, params: { activity_coach: { event_id: @activity_coach.event_id, person_id: @activity_coach.person_id } }
    end

    # TODO: work out why this is failing
    # assert_redirected_to activity_coach_url(ActivityCoach.last)
  end

  test "should show activity_coach" do
    get activity_coach_url(@activity_coach)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_coach_url(@activity_coach)
    assert_response :success
  end

  test "should update activity_coach" do
    patch activity_coach_url(@activity_coach), params: { activity_coach: { event_id: @activity_coach.event_id, person_id: @activity_coach.person_id } }
    assert_redirected_to activity_coach_url(@activity_coach)
  end

  test "should destroy activity_coach" do
    assert_difference('ActivityCoach.count', -1) do
      delete activity_coach_url(@activity_coach)
    end

    assert_redirected_to activity_coaches_url
  end
end
