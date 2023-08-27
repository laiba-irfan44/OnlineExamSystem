class CustomDeviseMailer < Devise::Mailer
  layout "mailer"
  default from: "laiba.intern@devsinc.com" 
end
