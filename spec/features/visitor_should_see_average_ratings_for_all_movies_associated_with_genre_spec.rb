require 'rails_helper'

describe 'Visitor' do
  context 'visits the genre show page' do
    it 'can see average rating for all moves in this genre' do
      genre1 = Genre.create(name: 'Sci-Fi')
      director = Director.create(name: 'Brad Paisley')
      movie1 = genre1.movies.create(title: 'New Movie', description: 'New Thing Movie', director_id: director.id, rating: 4)
      movie2 = genre1.movies.create(title: 'Newer Movie', description: 'Best Thing', director_id: director.id, rating: 2)
      average_rating = (movie1.rating + movie2.rating) / 2
      visit(genre_path(genre1))
      save_and_open_page
      expect(page).to have_content("Average Rating for All Movies in this Genre:\n#{average_rating}")
    end
  end
end


