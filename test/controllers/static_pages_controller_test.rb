require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "root path" do 
    get root_path
    assert_response :success
  end

  test "home path" do 
    get home_path 
    assert_response :success 
  end

  test "about path" do 
    get about_path 
    assert_response :success
  end

  test "feed path" do 
    get feed_path
    assert_redirected_to new_user_session_path
  end  
    
end
