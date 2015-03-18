ActionMailer::Base.delivery_method = :smtp


ActionMailer::Base.smtp_settings = {
    :tls                  => false,
    :address              => 'smtp.sendgrid.net' || ENV['GMAIL_SMTP_ADDRESS'],
    :port                 => 587,
    :domain               => 'heroku.com' || ENV['GMAIL_SMTP_DOMAIN'],
    :user_name            => ENV['SENDGRID_USERNAME'] || ENV['GMAIL_SMTP_USER_NAME'],
    :password             => ENV['SENDGRID_PASSWORD'] || ENV['GMAIL_SMTP_PASSWORD'],
    :authentication       => 'plain',
    :enable_starttls_auto => true
}

