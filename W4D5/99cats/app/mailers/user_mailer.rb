class UserMailer < ApplicationMailer
  default from: 'max@cats.com'

  def welcome_email(user, email)
    @user = user
    mail(to: email, subject: 'Welcome to Cats site!')
  end

end
