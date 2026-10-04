require "test_helper"

class Users::AccountControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "should get show" do
    get users_account_url
    assert_response :success
  end
end
