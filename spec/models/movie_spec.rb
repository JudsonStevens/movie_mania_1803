require 'rails_helper'

describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to(:director)}
    it {should have_many(:actors).through(:actor_movies)}
    it {should have_many(:genres).through(:genre_movies)}
  end

  describe 'instance methods' do
    it 'should generate a slug for a new movie' do
      director = Director.create(name: 'foo')
      movie = director.movies.create(title: 'Jurassic Park', description: 'blah')

      expect(movie.slug).to eq(movie.title.parameterize)
    end

    it 'should find 3 movies with similar rating' do
      director = Director.create(name: 'Brad Paisley')
      movie = director.movies.create!(title: 'New Movie', description: 'New Thing Movie', rating: 4)
      movie2 = director.movies.create!(title: 'Newer Movie', description: 'Newer Thing Movie', rating: 4)
      movie3 = director.movies.create!(title: 'Newest Movie', description: 'Newest Thing Movie', rating: 4)
      movie4 = director.movies.create!(title: 'Old Movie', description: 'Old Thing Movie', rating: 4)
      movie5 = director.movies.create!(title: 'Unexpected Title', description: 'Never', rating: 4)
      genre1 = movie.genres.create(name: 'Sci-Fi')
      genre2 = movie.genres.create(name: 'Horror')

      expect(Movie.similar_movies(movie).length).to eq(3)
      expect(Movie.similar_movies(movie).first).to eq(movie2)
      expect(Movie.similar_movies(movie).last).to eq(movie4)
      expect(Movie.similar_movies(movie).include?(movie5)).to eq(false)
    end
  end
end
