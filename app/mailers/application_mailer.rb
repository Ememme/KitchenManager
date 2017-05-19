class ApplicationMailer < ActionMailer::Base
  default from: 'test@test.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000'
    mail(to: @user.email, subject: 'Welcome to My Awesome App')
  end
end
