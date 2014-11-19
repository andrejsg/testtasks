require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
  	@user = User.new(first_name: "John", last_name: "Smith", email: "johnsmith@somemail.com", password: "password", password_confirmation: "password")
  end

  test "should be valid" do
  	assert_equal true, @user.valid?
  end

  test "first name should be present" do
  	@user.first_name = "  "
  	assert_equal false, @user.valid?
  end

  test "last name should be present" do
  	@user.last_name = "  "
  	assert_equal false, @user.valid?
  end

  test "email should be present" do
  	@user.email = "  "
  	assert_equal false, @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert_equal true, @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_equal false, @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    new_user = @user.dup
    new_user.email = @user.email.upcase
    @user.save
    assert_equal false, new_user.valid?
  end

  test "user password is a minimum 8 symbols length" do
    @user.password = @user.password_confirmation = "pass"
    assert_equal false, @user.valid?
  end
end
