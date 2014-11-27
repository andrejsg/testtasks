#encoding: utf-8

class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def account_activation(user)
    @user = user
    #mail to: user.email, subject: "Reģistrācijas apstiprināšana"
    mail to: user.email, subject: "RA"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "PA"
    #mail to: user.email, subject: "Paroles atjaunošana"
  end
end
