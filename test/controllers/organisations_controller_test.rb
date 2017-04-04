require 'test_helper'

class OrganisationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organisation = organisations(:one)
  end

  test "should get index" do
    get organisations_url
    assert_response :success
  end

  test "should get new" do
    get new_organisation_url
    assert_response :success
  end

  test "should create organisation" do
    assert_difference('Organisation.count') do
      post organisations_url, params: { organisation: { activity: @organisation.activity, address_1: @organisation.address_1, address_2: @organisation.address_2, city: @organisation.city, email: @organisation.email, name: @organisation.name, notes: @organisation.notes, postcode: @organisation.postcode, tel: @organisation.tel } }
    end

    assert_redirected_to organisation_url(Organisation.last)
  end

  test "should show organisation" do
    get organisation_url(@organisation)
    assert_response :success
  end

  test "should get edit" do
    get edit_organisation_url(@organisation)
    assert_response :success
  end

  test "should update organisation" do
    patch organisation_url(@organisation), params: { organisation: { activity: @organisation.activity, address_1: @organisation.address_1, address_2: @organisation.address_2, city: @organisation.city, email: @organisation.email, name: @organisation.name, notes: @organisation.notes, postcode: @organisation.postcode, tel: @organisation.tel } }
    assert_redirected_to organisation_url(@organisation)
  end

  test "should destroy organisation" do
    assert_difference('Organisation.count', -1) do
      delete organisation_url(@organisation)
    end

    assert_redirected_to organisations_url
  end
end
