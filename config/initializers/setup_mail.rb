ActionMailer::Base.delivery_method = :smtp

if Rails.env.production? || Rails.env.development?
  ActionMailer::Base.smtp_settings = {
    :tls                  => false,
    :address              => 'smtp.sendgrid.net',
    :port                 => 587,
    :domain               => 'heroku.com',
    :user_name            => ENV['SENDGRID_USERNAME'],
    :password             => ENV['SENDGRID_PASSWORD'],
    :authentication       => 'plain',
    :enable_starttls_auto => true
  }
else
  ActionMailer::Base.smtp_settings = {
    :tls                  => false,
    :address              => 'smtp.gmail.com',
    :port                 => 587,
    :domain               => 'gmail.com',
    :user_name            => 'juliabloctest@gmail.com',
    :password             => 'julia94403',
    :authentication       => 'plain',
    :enable_starttls_auto => true
  }
end