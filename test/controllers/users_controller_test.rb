require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "not logged in user redirected to login accessing my profile" do 
    get profile_path
    assert_redirected_to new_user_session_path
  end 
  
end
