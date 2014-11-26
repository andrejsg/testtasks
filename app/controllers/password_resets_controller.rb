#encoding: utf-8

class PasswordResetsController < ApplicationController

  before_filter :get_user, only: [:edit, :update]
  before_filter :valid_user, only: [:edit, :update]
  before_filter :check_expiration, only: [:edit, :update]

  def new
  end

  def create
	  @user = User.find_by_email(params[:password_reset][:email].downcase)
  	if @user
      @user.create_reset_digest
     	@user.send_password_reset_email
     	flash[:info] = "Email sent with password reset instructions"
     	redirect_to root_url
    else
     	flash.now[:danger] = "Email address not found"
     	render 'new'
    end
  end

  def edit
  end

  def update
    if passwords_blank?
      flash.now[:danger] = "Nav aizpildīti visi nepieciešamie lauki"
      render 'edit'
    elsif @user.update_attributes(params[:user])
      log_in @user
      flash[:success] = "Parole atjaunota"
      redirect_to root_path
    else
      render 'edit'
    end
  end


  private

  def get_user

    @user = User.find_by_email(params[:email])
  end

  def valid_user
    unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  def passwords_blank?
    params[:user][:password].blank? &&
    params[:user][:password_confirmation].blank?
  end

  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Paroles atjaunošanai atvēlētais laiks ir beidzies. Mēģiniet vēlreiz."
      redirect_to new_password_reset_url
    end
  end

end

