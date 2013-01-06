require_dependency "brewery/application_controller"

module Brewery
  class AuthCore::UsersController < ApplicationController
    def new
      @user = AuthCore::User.new
    end

    def create
      @user = AuthCore::User.new(user_params(true))

      if @user.save
        redirect_to main_app.root_path, notice: I18n.t('create.success', scope: i18n_scope)
      else
        render :new
      end
    end

    def confirm
      @user = AuthCore::User.where(perishable_token: params[:key]).first

      if @user.nil?
        redirect_to main_app.root_path
      else
        @user.active = true
        @user.save! # Failure on this should not happen.
        redirect_to main_app.root_path
      end
    end

    private

    def user_params(is_new)
      base_allowed = [:family_name, :other_names, :password, :password_confirmation, :new_email]
      if is_new
        params.require(:auth_core_user).permit(:email, *base_allowed)
      else
        params.require(:auth_core_user).permit(*base_allowed)
      end
    end

    def i18n_scope
      return [:brewery, :auth_core, :users]
    end
  end
end