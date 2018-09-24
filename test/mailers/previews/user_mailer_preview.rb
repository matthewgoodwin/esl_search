class UserMailerPreview < ActionMailer::Preview
  def welcome
    user1 = User.last
    UserMailer.welcome(user1)
    # calls app/mailers/user_mailer.rb
    # http://localhost:3000/rails/mailers/user_mailer/welcome
  end
end
