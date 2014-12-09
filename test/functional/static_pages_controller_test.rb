require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get index" do
  	@user = User.create(first_name: "John", last_name: "Smith", email: "johnsmitth@somemail.com", password: "password", password_confirmation: "password")
  	session[:user_id] = @user.id
    get :index
    assert_response :success
  end

  test "unsigned_in users redirectd" do
  	get :index
  	assert_response 302
  	assert_redirected_to login_path
  end

end
