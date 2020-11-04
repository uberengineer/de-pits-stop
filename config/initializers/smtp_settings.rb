ActionMailer::Base.smtp_settings = {
  address: 'depitskeuken.nl',
  port: 25,
  user_name: ENV['MAILER_ADDRESS'],
  password: ENV['MAILER_PASSWORD'],
  authentication: :login,
}
