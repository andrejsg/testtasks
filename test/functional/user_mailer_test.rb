require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = User.create(first_name: "John", last_name: "Smith", email: "johnsmitth@somemail.com", password: "password", password_confirmation: "password")
    user.activation_token = User.new_token

    mail = UserMailer.account_activation(user)
    assert_equal "Account activation", mail.subject
    assert_equal ["johnsmitth@somemail.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    #assert_match "Hi", mail.body.encoded
  end

  test "password_reset" do
    mail = UserMailer.password_reset
    assert_equal "Password reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    #assert_match "Hi", mail.body.encoded
  end

end
