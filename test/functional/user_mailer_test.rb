#encoding: utf-8

require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  setup do
    @user = User.create(first_name: "John", last_name: "Smith", email: "johnsmitth@somemail.com", password: "password", password_confirmation: "password")
  end

  test "account_activation" do
    @user.activation_token = User.new_token
    mail = UserMailer.account_activation(@user)
    assert_equal "Confirm registration.", mail.subject
    assert_equal ["johnsmitth@somemail.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    #assert_match "Hi", mail.body.encoded
  end

  test "password_reset" do
    @user.reset_token = User.new_token
    mail = UserMailer.password_reset(@user)
    assert_equal "Reset password", mail.subject
    assert_equal ["johnsmitth@somemail.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    #assert_match "Hi", mail.body.encoded
  end

end
