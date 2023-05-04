require "test_helper"

class Providers::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get providers_customers_show_url
    assert_response :success
  end

  test "should get edit" do
    get providers_customers_edit_url
    assert_response :success
  end

  test "should get update" do
    get providers_customers_update_url
    assert_response :success
  end

  test "should get quit" do
    get providers_customers_quit_url
    assert_response :success
  end

  test "should get destroy" do
    get providers_customers_destroy_url
    assert_response :success
  end
end
