# frozen_string_literal: true

class CustomDeviseMailer < Devise::Mailer
  layout 'mailer'
  default from: 'laiba.intern@devsinc.com'
end
