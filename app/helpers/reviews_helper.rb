module ReviewsHelper
  def get_review_info(review)
    review.username + " " + time_ago_in_words(review.created_at) + ' ago'
  end
end
