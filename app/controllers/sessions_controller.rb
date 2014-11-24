#encoding: utf-8

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Reģistrācija nav apstiprināta."
        message += "Pārbaudiet savu e-pastu."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Nepareiza e-pasta adrese vai parole.'
      render 'new'
    end
  end

  def destroy
    log_out if signed_in?
    redirect_to root_path
  end
end
