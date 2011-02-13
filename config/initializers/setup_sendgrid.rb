ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => '25',
  :domain => "katalyst.com.au",
  :authentication => :plain,
  :user_name => "jason@katalyst.com.au",
  :password => "i9XypcTh2GOptAvK"
}
