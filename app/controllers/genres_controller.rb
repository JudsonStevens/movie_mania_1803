class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to genres_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @genre = Genre.find(params[:id])
    @movies = @genre.movies
    @highest_rated = @genre.highest_rated_movie
    @lowest_rated = @genre.lowest_rated_movie
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end