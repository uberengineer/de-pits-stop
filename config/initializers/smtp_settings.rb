ActionMailer::Base.smtp_settings = {
  address: 'srv12243.hostingserver.nl',
  port: 587,
  domain: 'depitskeuken.nl',
  user_name: ENV['MAILER_USERNAME'],
  password: ENV['MAILER_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}
