require 'rails_helper'

describe "User visits genre index page" do
  context "as admin" do
    it "can create a new genre" do
      admin = User.create(username: "Dee", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre1 = Genre.create(name: 'Sci-Fi')
      genre2 = Genre.create(name: 'Horror')

      name = 'Comedy'

      visit(genres_path)

      fill_in('genre[name]', with: name)
      click_on('Create Genre')

      expect(current_path).to eq(genres_path)
      expect(page).to have_content(name)
      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
    end

    it "is redirected back to genre index if creation doesn't work" do
      admin = User.create(username: "Dee", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre1 = Genre.create(name: 'Sci-Fi')
      genre2 = Genre.create(name: 'Horror')

      name = 'Comedy'

      visit(genres_path)

      click_on('Create Genre')

      expect(current_path).to eq(genres_path)
      expect(page).to_not have_content(name)
      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
    end
  end
end