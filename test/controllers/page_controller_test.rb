require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get privacy" do
    get page_privacy_url
    assert_response :success
  end

  test "should get copyright" do
    get page_copyright_url
    assert_response :success
  end

  test "should get rules" do
    get page_rules_url
    assert_response :success
  end

  test "should get about" do
    get page_about_url
    assert_response :success
  end

end
