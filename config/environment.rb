# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => ENV['SENDGRID_KEY'],
  :domain => 'depitskeukenbestellen',
  :address => 'smtp.sendgrid.net',
  :port => 25,
  :authentication => :plain,
  :enable_starttls_auto => true
}
