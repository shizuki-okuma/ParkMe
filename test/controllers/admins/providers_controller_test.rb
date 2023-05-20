require "test_helper"

class Admins::ProvidersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_providers_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_providers_show_url
    assert_response :success
  end
end
