#encoding: utf-8

class AccountActivationsController < ApplicationController

	def edit
    user = User.find_by_email(params[:email])
    user.activate
    redirect_to user
=begin
    if user && !user.activated && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated"
      redirect_to user
    else
      flash[:danger] = "Account is not activated"
      redirect_to root_url
    end
=end
  end
end
