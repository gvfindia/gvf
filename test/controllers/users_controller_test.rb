require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:tathagata)
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
=begin
  test "should create user" do
    existing_user = User.find_by_email!(@user.email)
    User.delete(existing_user)
    byebug
    assert_difference('User.count') do
      post :create, user: { email: @user.email, name: @user.name, password_digest: @user.password_digest }
    end
    assert_redirected_to user_path(assigns(:user))
  end
=end
  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end
    assert_redirected_to users_path
  end
end
