require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = User.create(first_name: "John", last_name: "Smith", email: "johnsmith@somemail.com", password: "password", password_confirmation: "password")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: "jonniesmeet@mail.com", first_name: "Jonnie", last_name: "Smeet", password: "password", password_confirmation: "password" }
    end

    assert_redirected_to static_pages_index_path
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, password: "password", password_confirmation: "password" }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
