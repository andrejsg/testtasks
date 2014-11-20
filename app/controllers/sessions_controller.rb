#encoding: utf-8

class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      log_in user
  		redirect_to static_pages_index_path
  	else
  		flash.now[:danger] = "E-pasts vai parole nesakrīt."
  		render 'new'
  	end
  end

  def destroy
  end
end
