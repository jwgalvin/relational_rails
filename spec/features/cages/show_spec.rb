require 'rails_helper'

RSpec.describe 'the cage show page' do
  it 'displays the cage title' do
    cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
    cage_2 = Cage.create!(title: "Pabu Land", is_open: false, ferret_count: 4, ferret_capacity: 5)
    visit "/cages/#{cage.id}"

    expect(page).to have_content(cage.title)
    expect(page).to_not have_content(cage_2.title)
  end

  it 'displays the cage title' do
    cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
    cage_2 = Cage.create!(title: "Pabu Land", is_open: false, ferret_count: 4, ferret_capacity: 5)
    visit "/cages/#{cage.id}"

    expect(page).to have_content(cage.title)
  end
  describe 'User story 7' do
    it 'shows number of ferrets in the cage' do
      cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
      ferret = cage.ferrets.create!(name: "Pabu", is_clean: false, age: 1)
      ferret_2 = cage.ferrets.create!(name: "Loki", is_clean: true, age: 1)
      ferret_3 = cage.ferrets.create!(name: "Thor", is_clean: true, age: 1)
      visit "/cages/#{cage.id}"

      expect(page).to have_content("There are #{cage.ferret_count} ferrets in this cage")
    end
  end
end
