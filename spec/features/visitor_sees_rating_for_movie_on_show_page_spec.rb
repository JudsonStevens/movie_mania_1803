require 'rails_helper'

describe 'Visitor' do
  context 'visits the movie show page' do
    it 'can see the rating for that movie' do
      director = Director.create(name: 'Brad Paisley')
      movie = director.movies.create!(title: 'New Movie', description: 'New Thing Movie', rating: 4)
      genre1 = movie.genres.create(name: 'Sci-Fi')
      genre2 = movie.genres.create(name: 'Horror')

      visit(movie_path(movie.slug))

      expect(page).to have_content("Rating for this Movie:\n#{movie.rating}")
    end
  end
end
