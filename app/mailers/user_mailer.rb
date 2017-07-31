class UserMailer < ApplicationMailer
  default from: "imdb@example.com"
  
  def favorited_users(user, movie, reviewd_user)
    @greeting = "Hi, Your Favorited Movie is just reviewd. Have a look at it."
    @user = user
    @movie = movie
    @reviewd_user = reviewd_user
    mail to: user.email, subject: "Notification"
  end
end
