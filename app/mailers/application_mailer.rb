class ApplicationMailer < ActionMailer::Base
  default from: 'eventbrite.like@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://immense-reaches-87063.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome subject')
  end
end
