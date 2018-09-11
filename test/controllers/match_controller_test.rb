require 'test_helper'

class MatchControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get match_new_url
    assert_response :success
  end

  test "should get create" do
    get match_create_url
    assert_response :success
  end

end
