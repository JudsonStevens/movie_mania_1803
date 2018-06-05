require 'rails_helper'

describe 'Visitor' do
  context 'visits the genre index page' do
    it 'can see all genres with links to show pages, but cannot see form to create' do
      genre1 = Genre.create(name: 'Sci-Fi')
      director = Director.create(name: 'Brad Paisley')
      movie1 = genre1.movies.create(title: 'New Movie', description: 'New Thing Movie', director_id: director.id)
      movie2 = genre1.movies.create(title: 'Newer Movie', description: 'Best Thing', director_id: director.id)

      visit(genre_path(genre1))

      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie2.title)
    end
  end
end

