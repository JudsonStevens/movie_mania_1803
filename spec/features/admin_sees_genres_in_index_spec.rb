require 'rails_helper'

describe "User visits genre index page" do
  context "as admin" do
    it "allows admin to see all genre" do
      admin = User.create(username: "Dee", password: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      genre1 = Genre.create(name: 'Sci-Fi')
      genre2 = Genre.create(name: 'Horror')

      visit(genres_path)

      expect(page).to have_content(genre1.name)
      expect(page).to have_content(genre2.name)
    end
  end
end
