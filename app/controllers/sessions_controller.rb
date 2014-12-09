#encoding: utf-8

class SessionsController < ApplicationController
  def new
    if signed_in?
      redirect_to static_pages_index_path
    end
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget_user(user)
        redirect_to static_pages_index_path
      else
        message  = "Registration is  not confirmed. "
        message += "Check your mail."
        flash[:warning] = message
        redirect_to login_path
      end
    else
      flash.now[:danger] = 'Wrong email or password'
      render 'new'
    end
  end

  def destroy
    log_out if signed_in?
    redirect_to login_path
  end
end
