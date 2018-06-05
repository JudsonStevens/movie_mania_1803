require 'rails_helper'

describe 'Visitor' do
  context 'visits the movie show page' do
    it 'can see up to three movies with the same rating' do
      director = Director.create(name: 'Brad Paisley')
      movie = director.movies.create!(title: 'New Movie', description: 'New Thing Movie', rating: 4)
      movie2 = director.movies.create!(title: 'Newer Movie', description: 'Newer Thing Movie', rating: 4)
      movie3 = director.movies.create!(title: 'Newest Movie', description: 'Newest Thing Movie', rating: 4)
      movie4 = director.movies.create!(title: 'Old Movie', description: 'Old Thing Movie', rating: 4)
      genre1 = movie.genres.create(name: 'Sci-Fi')
      genre2 = movie.genres.create(name: 'Horror')

      visit(movie_path(movie.slug))

      expect(page).to have_content("Movies That Share This Rating:\n#{movie2.title} #{movie3.title} #{movie4.title}")
    end
    
    it 'can see up to three movies with the same rating and not any others' do
      director = Director.create(name: 'Brad Paisley')
      movie = director.movies.create!(title: 'New Movie', description: 'New Thing Movie', rating: 4)
      movie2 = director.movies.create!(title: 'Newer Movie', description: 'Newer Thing Movie', rating: 4)
      movie3 = director.movies.create!(title: 'Newest Movie', description: 'Newest Thing Movie', rating: 4)
      movie4 = director.movies.create!(title: 'Old Movie', description: 'Old Thing Movie', rating: 4)
      movie5 = director.movies.create!(title: 'Unexpected Title', description: 'Never', rating: 4)
      genre1 = movie.genres.create(name: 'Sci-Fi')
      genre2 = movie.genres.create(name: 'Horror')

      visit(movie_path(movie.slug))

      expect(page).to have_content("Movies That Share This Rating:\n#{movie2.title} #{movie3.title} #{movie4.title}")
      expect(page).to_not have_content(movie5.title)
    end

  end
end