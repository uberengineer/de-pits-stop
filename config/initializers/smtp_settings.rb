ActionMailer::Base.smtp_settings = {
  address: 'srv12243.hostingserver.nl',
  port: 587,
  domain: ENV['DOMAIN'],
  user_name: ENV['MAILER_ADDRESS'],
  password: ENV['MAILER_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}
