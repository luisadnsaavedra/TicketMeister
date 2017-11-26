class ApplicationMailer < ActionMailer::Base
  default to: "support@ticketmeister.com", from: "contact@ticketmeister.com"
  layout 'mailer'
end
