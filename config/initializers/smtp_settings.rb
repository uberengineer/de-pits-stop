ActionMailer::Base.smtp_settings = {
  address: 'depitskeuken.nl',
  port: 25,
  domain: 'depitskeuken.nl',
  user_name: ENV['MAILER_ADDRESS'],
  password: ENV['MAILER_PASSWORD'],
  authentication: :login,
}
