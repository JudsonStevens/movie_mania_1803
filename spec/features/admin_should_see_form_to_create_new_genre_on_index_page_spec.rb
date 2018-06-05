require 'rails_helper'

describe "User visits genre index page" do
  context "as admin" do
    it "can see a form to create a new genre" do
      admin = User.create(username: "Dee", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre1 = Genre.create(name: 'Sci-Fi')
      genre2 = Genre.create(name: 'Horror')

      visit(genres_path)

      expect(page).to have_content('Create a New Genre')
      expect(page).to have_field('genre[name]')
    end
  end
end