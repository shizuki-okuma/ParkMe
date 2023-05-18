require "test_helper"

class Providers::RentalPricesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get providers_rental_prices_index_url
    assert_response :success
  end
end
