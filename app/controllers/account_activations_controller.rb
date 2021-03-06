#encoding: utf-8

class AccountActivationsController < ApplicationController

	def edit
    user = User.find_by_email(params[:email])

    if user && !user.activated && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated"
      redirect_to static_pages_index_path
    else
      flash[:danger] = "Account is not activated"
      redirect_to root_url
    end

  end
end
