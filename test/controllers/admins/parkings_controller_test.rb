require "test_helper"

class Admins::ParkingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_parkings_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_parkings_show_url
    assert_response :success
  end

  test "should get update" do
    get admins_parkings_update_url
    assert_response :success
  end
end
