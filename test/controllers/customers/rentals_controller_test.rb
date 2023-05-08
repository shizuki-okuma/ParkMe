require "test_helper"

class Customers::RentalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customers_rentals_new_url
    assert_response :success
  end

  test "should get confirm" do
    get customers_rentals_confirm_url
    assert_response :success
  end

  test "should get thanks" do
    get customers_rentals_thanks_url
    assert_response :success
  end

  test "should get create" do
    get customers_rentals_create_url
    assert_response :success
  end

  test "should get index" do
    get customers_rentals_index_url
    assert_response :success
  end

  test "should get show" do
    get customers_rentals_show_url
    assert_response :success
  end
end
