class Genre < ApplicationRecord
  validates_presence_of :name
  has_many :genre_movies
  has_many :movies, through: :genre_movies

  def average_rating
    movies.average(:rating)
  end

  def highest_rated_movie
    movies.order(rating: :desc).first
  end

  def lowest_rated_movie
    movies.order(rating: :asc).first
  end
end
