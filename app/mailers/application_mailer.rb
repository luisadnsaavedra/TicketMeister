class ApplicationMailer < ActionMailer::Base
  #TODO: check SendGrid as email solution
  default to: "support@ticketmeister.com", from: "contact@ticketmeister.com"
  layout 'mailer'
end
