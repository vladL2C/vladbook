require 'test_helper'

class SignInTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:vlad)
  end 

  test "logged in user profile page" do 
    log_in_as(@user)
    get profile_path(@user)
  end

  test "not logged user views their profile" do 
    get profile_path(@user)
    assert_redirected_to new_user_session_path
  end  
end
