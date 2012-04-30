class UserMailer < ActionMailer::Base
  default from: "ScrumRem2 <notifications@scrummy.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
  
  def password_sent(pass, user, email)
    @user = user
    @pass = pass
    mail :to => email, :subject => "Cuenta ScrumRem2"
  end
end
