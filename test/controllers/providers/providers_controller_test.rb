require "test_helper"

class Providers::ProvidersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get providers_providers_show_url
    assert_response :success
  end

  test "should get edit" do
    get providers_providers_edit_url
    assert_response :success
  end

  test "should get update" do
    get providers_providers_update_url
    assert_response :success
  end

  test "should get quit" do
    get providers_providers_quit_url
    assert_response :success
  end

  test "should get destroy" do
    get providers_providers_destroy_url
    assert_response :success
  end
end
