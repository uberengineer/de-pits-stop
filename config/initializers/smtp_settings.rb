ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: 'mail.google.com',
  user_name: ENV['gmail_username'],
  password: ENV['gmail_password'],
  authentication: :login,
  enable_starttls_auto: true
}
