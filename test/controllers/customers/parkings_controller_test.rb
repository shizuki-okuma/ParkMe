require "test_helper"

class Customers::ParkingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customers_parkings_show_url
    assert_response :success
  end

  test "should get index" do
    get customers_parkings_index_url
    assert_response :success
  end
end
