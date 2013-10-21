require 'test_helper'

class RootControllerTest < ActionController::TestCase
  test "should get cli" do
    get :cli
    assert_response :success
  end

end
