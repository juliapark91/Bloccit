if Rails.env.development? #if Rails.env.development? will stop Rails from reading these mail settings in Production, and block Production email confirmation. We'll fix this together.
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.gmail.com',
    port:           '587',
    authentication: :plain,
    password:       'juliabloctest@gmail.com',
    user_name:      'julia94403', 
    domain:         'gmail.com',
    enable_starttls_auto: true
  }
end