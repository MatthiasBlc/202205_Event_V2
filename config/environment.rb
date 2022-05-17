# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings =   {
  :address            => 'in-v3.mailjet.com',
  :port               => 587,
  :domain             => 'google.com', #you can also use google.com
  :authentication     => :plain,
  :user_name          => ENV['MAILJET_API'],
  :password           => ENV['MAILJET_KEY']
}