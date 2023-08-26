class CustomDeviseMailer < Devise::Mailer
  layout "mailer" # Use your custom mailer layout
  default from: "laiba.intern@devsinc.com" # Set a default sender email

  # Add any other customizations you need
end
