require "test_helper"

class Providers::ParkingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get providers_parkings_new_url
    assert_response :success
  end

  test "should get create" do
    get providers_parkings_create_url
    assert_response :success
  end

  test "should get edit" do
    get providers_parkings_edit_url
    assert_response :success
  end

  test "should get update" do
    get providers_parkings_update_url
    assert_response :success
  end

  test "should get show" do
    get providers_parkings_show_url
    assert_response :success
  end
end
