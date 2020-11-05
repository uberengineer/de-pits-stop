ActionMailer::Base.smtp_settings = {
  address: '81.4.96.183',
  port: 587,
  enable_starttls_auto: true,
  domain: 'srv12243.hostingserver.nl',
  user_name: ENV['MAILER_ADDRESS'],
  password: ENV['MAILER_PASSWORD'],
  authentication: 'plain',
  openssl_verify_mode: 'none'
}
