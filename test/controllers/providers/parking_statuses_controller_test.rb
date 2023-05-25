require "test_helper"

class Providers::ParkingStatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get providers_parking_statuses_create_url
    assert_response :success
  end

  test "should get destroy" do
    get providers_parking_statuses_destroy_url
    assert_response :success
  end
end
