require 'rails_helper'

describe 'Visitor' do
  context 'visits the genre show page' do
    it 'can see name and rating of highest rated movie' do
      genre1 = Genre.create(name: 'Sci-Fi')
      director = Director.create(name: 'Brad Paisley')
      movie1 = genre1.movies.create(title: 'New Movie', description: 'New Thing Movie', director_id: director.id, rating: 4)
      movie2 = genre1.movies.create(title: 'Newer Movie', description: 'Best Thing', director_id: director.id, rating: 2)

      visit(genre_path(genre1))
      expect(page).to have_content("Title and Rating of Highest Rated Movie:\n#{movie1.title} #{movie1.rating}")
    end
  end
end
