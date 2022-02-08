require 'rails_helper'

RSpec.describe 'cage index page' do
  it 'displays cage titles' do
    cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
    visit "/cages"

    expect(page).to have_content(cage.title)
  end
  describe 'User Story 6' do
    it 'order cages by creation time' do
      cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
      cage_2 = Cage.create!(title: "Pabu Kingdom", is_open: false, ferret_count: 4, ferret_capacity: 5)
      cage_3 = Cage.create!(title: "Adorable", is_open: false, ferret_count: 1, ferret_capacity: 4)
      visit "/cages"

      expect(cage_3.title).to appear_before(cage.title)
    end
    it 'shows creation time' do
      cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
      cage_2 = Cage.create!(title: "Pabu Kingdom", is_open: false, ferret_count: 4, ferret_capacity: 5)
      cage_3 = Cage.create!(title: "Adorable", is_open: false, ferret_count: 1, ferret_capacity: 4)
      visit "/cages"

      expect(page).to have_content(cage.created_at.strftime("%m/%d at %H:%M %p"))
    end
  end
end
