require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "favorited_users" do
    mail = UserMailer.favorited_users
    assert_equal "Favorited users", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
