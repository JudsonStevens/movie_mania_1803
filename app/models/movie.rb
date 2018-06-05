class Movie < ApplicationRecord
  belongs_to :director
  has_many :actor_movies
  has_many :actors, through: :actor_movies
  has_many :genre_movies
  has_many :genres, through: :genre_movies

  before_save :generate_slug

  def generate_slug
    self.slug = title.parameterize
  end

  def self.similar_movies(movie)
    Movie.where.not(id: movie.id).where(rating: movie.rating).limit(3)
  end
end
