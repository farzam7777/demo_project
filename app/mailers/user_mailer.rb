class UserMailer < ApplicationMailer
  default from: "imdb@example.com"
  
  def favorited_users(user, movie)
    @greeting = "Hi, Someone just reviewd the movie you marked as Favorited."
    @user = user
    @movie = movie
    mail to: user.email, subject: "Notification"
  end
end
