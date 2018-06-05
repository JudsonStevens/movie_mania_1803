require 'rails_helper'

describe 'Visitor' do
  context 'visits the genre index page' do
    it 'can see all genres with links to show pages, but cannot see form to create' do
      genre1 = Genre.create(name: 'Sci-Fi')
      genre2 = Genre.create(name: 'Horror')

      visit(genres_path)

      expect(page).to have_link(genre1.name)
      expect(page).to have_link(genre2.name)
      expect(page).to_not have_field('genre[name]')
      expect(page).to_not have_content('Create a New Genre')
    end

    it 'can click on one of the links to go to that genres show page' do
      genre1 = Genre.create(name: 'Sci-Fi')
      genre2 = Genre.create(name: 'Horror')

      visit(genres_path)
      click_on(genre1.name)

      expect(current_path).to eq(genre_path(genre1))
      expect(page).to have_content(genre1.name)
    end
  end
end

