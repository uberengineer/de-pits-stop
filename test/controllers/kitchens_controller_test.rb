require 'test_helper'

class KitchensControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get kitchens_update_url
    assert_response :success
  end

end
