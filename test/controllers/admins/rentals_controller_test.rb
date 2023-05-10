require "test_helper"

class Admins::RentalsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admins_rentals_update_url
    assert_response :success
  end
end
