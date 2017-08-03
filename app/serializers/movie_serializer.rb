class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :year, :url
  has_many :actors
  has_many :reviews
  has_many :posters
  has_one :movie_average
  def url
    view_context.movie_url(object)
  end
end
