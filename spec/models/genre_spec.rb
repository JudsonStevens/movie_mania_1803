require 'rails_helper'

RSpec.describe Genre, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:movies).through(:genre_movies)}

  describe 'instance methods' do
    it 'should calculate average rating for all moves in this genre' do
      genre1 = Genre.create(name: 'Sci-Fi')
      director = Director.create(name: 'Brad Paisley')
      movie1 = genre1.movies.create(title: 'New Movie', description: 'New Thing Movie', director_id: director.id, rating: 4)
      movie2 = genre1.movies.create(title: 'Newer Movie', description: 'Best Thing', director_id: director.id, rating: 2)
      average_rating = (movie1.rating + movie2.rating) / 2

      expect(genre1.average_rating).to eq(average_rating)
    end

    it 'should find the highest rated movie with this genre' do
      genre1 = Genre.create(name: 'Sci-Fi')
      director = Director.create(name: 'Brad Paisley')
      movie1 = genre1.movies.create(title: 'New Movie', description: 'New Thing Movie', director_id: director.id, rating: 4)
      movie2 = genre1.movies.create(title: 'Newer Movie', description: 'Best Thing', director_id: director.id, rating: 2)

      expect(genre1.highest_rated_movie).to eq(movie1)
    end

    it 'should find the lowest rated movie with this genre' do
      genre1 = Genre.create(name: 'Sci-Fi')
      director = Director.create(name: 'Brad Paisley')
      movie1 = genre1.movies.create(title: 'New Movie', description: 'New Thing Movie', director_id: director.id, rating: 4)
      movie2 = genre1.movies.create(title: 'Newer Movie', description: 'Best Thing', director_id: director.id, rating: 2)

      expect(genre1.lowest_rated_movie).to eq(movie2)
    end

  end
end
