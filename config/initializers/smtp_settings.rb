ActionMailer::Base.smtp_settings = {
  address: 'mail.depitskeuken.nl',
  port: 25,
  openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE,
  domain: 'depitskeuken.nl',
  user_name: ENV['MAILER_ADDRESS'],
  password: ENV['MAILER_PASSWORD'],
  authentication: :login,
}
