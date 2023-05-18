require "test_helper"

class Providers::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get providers_homes_top_url
    assert_response :success
  end
end
