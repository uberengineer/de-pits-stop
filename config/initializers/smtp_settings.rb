ActionMailer::Base.smtp_settings = {
  address: 'depitskeuken.nl',
  port: 25,
  domain: 'srv12243.hostingserver.nl',
  user_name: ENV['MAILER_ADDRESS'],
  password: ENV['MAILER_PASSWORD'],
  authentication: :login,
}
