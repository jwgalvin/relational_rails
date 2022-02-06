require 'rails_helper'

RSpec.describe 'the cage idex page' do
  it 'displays cage titles' do
    cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
    visit "/cages"

    expect(page).to have_content(cage.title)
  end
end
