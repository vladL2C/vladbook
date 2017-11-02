require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "valid home page signup" do 
    get root_path
    assert_difference 'User.count', 1 do 
      post user_registration_path, params: { user: 
        { name: "vlad", surname: "saraev", email: "vlad@hotmail.co.nz",
         birth_date: "", password: "terminator", password_confirmation: "terminator" } }
    end
    assert_redirected_to home_path
    get home_path
    assert_select 'h1.title'
  end

  test "invalid home page signup" do
    get root_path 
      assert_no_difference 'User.count' do 
      post user_registration_path, params: { user: 
        { name: "", surname: "", email: "",
         birth_date: "", password: "", password_confirmation: "" } }
      end 
    assert_template 'devise/registrations/new'
    assert_select 'div#error_explanation'  
  end        
end
