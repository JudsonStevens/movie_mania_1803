require 'rails_helper'

describe 'Visitor' do
  context 'visits the movie show page' do
    it 'can see all genres associated with that movie' do
      director = Director.create(name: 'Brad Paisley')
      movie = director.movies.create!(title: 'New Movie', description: 'New Thing Movie')
      genre1 = movie.genres.create(name: 'Sci-Fi')
      genre2 = movie.genres.create(name: 'Horror')

      visit(movie_path(movie.slug))

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
      expect(page).to have_content('Genres for this Movie:')
    end
  end
end