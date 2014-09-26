require 'test_helper'

class WelControllerTest < ActionController::TestCase
  test "should get ganesan" do
    get :ganesan
    assert_response :success
  end

end
