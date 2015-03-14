if Rails.env.development? 
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    password:       ENV['SENDGRID_PASSWORD'],
    user_name:      ENV['SENDGRID_USERNAME'], #we use environment variables to not reveal sensitive information
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end