# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  def contact_email
    ContactMailer.contact_email("username@email.com", "User Name", "0123456789",
      @message = "I was trying to buy some tickets but they appear as unavailable, even though the seats are supposed to be free.")
  end

end
