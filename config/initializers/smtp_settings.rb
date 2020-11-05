ActionMailer::Base.smtp_settings = {
  address: 'mail.depitskeuken.nl',
  port: 587,
  enable_starttls_auto: true,
  domain: 'srv12243.hostingserver.nl',
  user_name: ENV['MAILER_ADDRESS'],
  password: ENV['MAILER_PASSWORD'],
  authentication: :cram_md5,
}
