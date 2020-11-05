ActionMailer::Base.smtp_settings = {
  address: 'mail.depitskeuken.nl',
  port: 587,
  enable_starttls_auto: true,
  domain: 'depitskeuken.nl',
  user_name: ENV['MAILER_ADDRESS'],
  password: ENV['MAILER_PASSWORD'],
  authentication: :login,
}
