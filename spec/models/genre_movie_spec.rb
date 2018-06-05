require 'rails_helper'

RSpec.describe GenreMovie, type: :model do
  it { should belong_to(:movie) }
  it { should belong_to(:genre) }
end
