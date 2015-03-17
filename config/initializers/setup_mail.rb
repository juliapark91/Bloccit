if Rails.env.development? #if Rails.env.development? will stop Rails from reading these mail settings in Production, and block Production email confirmation. We'll fix this together.
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.gmail.com',
    port:           '587',
    authentication: :plain,
    password:       ENV['juliabloctest@gmail.com'],
    user_name:      ENV['julia94403'], #we use environment variables to not reveal sensitive information
    domain:         'gmail.com',
    enable_starttls_auto: true
  }
end