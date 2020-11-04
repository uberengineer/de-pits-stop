ActionMailer::Base.smtp_settings = {
  address: 'contact@depitskeuken.nl',
  port: 25,
  domain: 'depitskeuken.nl',
  user_name: ENV['MAILER_ADDRESS'],
  password: ENV['MAILER_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}
