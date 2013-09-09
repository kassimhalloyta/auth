class UserMailer < ActionMailer::Base
  default :from  => "admin@waanisa.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def welcome_email(user)
  @user = user
  mail :to => user.email, :subject => "unkaq"
end
  def password_reset(user)
  @user = user
  mail :to => user.email, :subject => "Password Reset"
end

 
end
