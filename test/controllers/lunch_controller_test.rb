require 'test_helper'

class LunchControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get lunch_view_url
    assert_response :success
  end

  test "should get signup" do
    get lunch_signup_url
    assert_response :success
  end

end
