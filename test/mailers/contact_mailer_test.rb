require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase

  test "should return contact email" do
    mail = ContactMailer.contact_email("username@email.com", "User Name", "0123456789", @message = "Test Message")
    assert_equal ['support@ticketmeister.com'], mail.to
    assert_equal ['contact@ticketmeister.com'], mail.from
  end

end
