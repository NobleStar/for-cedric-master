require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get getting_started" do
    get :getting_started
    assert_response :success
  end

end
