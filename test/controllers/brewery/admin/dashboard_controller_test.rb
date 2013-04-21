require 'test_helper'

module Brewery
  class Admin::DashboardControllerTest < ActionController::TestCase
    test "index is denied as anonymous user" do
      get :index, use_route: :brewery

      assert_response :redirect
      assert_not_nil flash[:error]
    end

    test "index is permitted as admin user" do
      login_as(:user_with_admin_rights)
      get :index, use_route: :brewery

      puts flash.inspect
      assert_response :success
      assert_nil flash[:error]
    end

    test "index is denied as non admin user" do
      login_as(:user_2_with_full_names)
      get :index, use_route: :brewery

      assert_response :redirect
      assert_not_nil flash[:error]
    end
  end
end