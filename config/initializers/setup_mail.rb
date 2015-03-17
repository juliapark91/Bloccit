if Rails.env.development? #if Rails.env.development? will stop Rails from reading these mail settings in Production, and block Production email confirmation. We'll fix this together.
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.gmail.com',
    port:           '587',
    authentication: :plain,
    user_name:       'juliabloctest@gmail.com',
    password:      'julia94403', 
    domain:         'gmail.com',
    enable_starttls_auto: true
  }
end