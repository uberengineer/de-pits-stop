# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'localhost:3000',
  :address => 'smtp.sendgrid.net',
  :authentication => :plain,
  :enable_starttls_auto => true
}
