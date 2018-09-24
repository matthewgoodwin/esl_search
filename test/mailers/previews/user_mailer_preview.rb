class UserMailerPreview < ActionMailer::Preview
  def welcome
    user1 = User.last
    UserMailer.welcome(user1)
  end
end
