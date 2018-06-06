class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def show
    @genre = Genre.find(params[:id])
    @movies = @genre.movies
    # Set these in controller so that the object would be stored, since we need two
    # attributes in the view, this only touches the database once then we can call
    # that object twice to get its attributes.
    @highest_rated = @genre.highest_rated_movie
    @lowest_rated = @genre.lowest_rated_movie
  end
end