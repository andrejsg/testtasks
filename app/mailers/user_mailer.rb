#encoding: utf-8

class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def account_activation(user)
    if Rails.env == "production"
      @url = ENV['ROOT_URL']
    else
      @url = "http://localhost:3000"
    end

    @user = user
    mail to: user.email, subject: "Confirm registration."
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    if Rails.env == "production"
      @url = ENV['ROOT_URL']
    else
      @url = "http://localhost:3000"
    end

    @user = user
    mail to: user.email, subject: "Reset password"
  end
end
