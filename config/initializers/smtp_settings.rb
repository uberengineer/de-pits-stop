ActionMailer::Base.smtp_settings = {
  address: 'srv12243.hostingserver.nl',
  port: 587,
  enable_starttls_auto: true,
  user_name: ENV['MAILER_ADDRESS'],
  password: ENV['MAILER_PASSWORD'],
  authentication: 'plain',
  openssl_verify_mode: 'none'
}
