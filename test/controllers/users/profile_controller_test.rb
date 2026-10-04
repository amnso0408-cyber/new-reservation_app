require "test_helper"

class Users::ProfileControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "should get show" do
    get users_profile_url
    assert_response :success
  end
end
