ActionMailer::Base.smtp_settings = {
  address: 'srv12243.hostingserver.nl',
  port: 587,
  enable_starttls_auto: true,
  user_name: 'contact@depitskeuken.nl',
  password: 'L&4k9kn4',
  authentication: 'plain',
  openssl_verify_mode: 'none'
}
