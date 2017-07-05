Clearance.configure do |config|
  config.mailer_sender = "reply@gofg.com"
  config.rotate_csrf_on_sign_in = true
  config.routes = false
  config.allow_sign_up = false
  config.sign_in_guards = [SignUpGuard]
end
