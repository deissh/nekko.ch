require 'test_helper'

class AnimeControllerTest < ActionDispatch::IntegrationTest
  test "should get full" do
    get anime_full_url
    assert_response :success
  end
end
