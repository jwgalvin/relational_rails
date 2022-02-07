require 'rails_helper'

RSpec.describe 'the cage show page' do
  it 'displays the cage title' do
    cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
    cage_2 = Cage.create!(title: "Pabu Land", is_open: false, ferret_count: 4, ferret_capacity: 5)
    ferret = cage.ferrets.create!(name: "Pabu", is_clean: true, age: 1)
    visit "/cages/#{cage.id}"

    expect(page).to have_content(cage.title)
    expect(page).to_not have_content(cage_2.title)
  end

  it 'displays the cage title' do
    cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
    cage_2 = Cage.create!(title: "Pabu Land", is_open: false, ferret_count: 4, ferret_capacity: 5)
    ferret = cage.ferrets.create!(name: "Pabu", is_clean: true, age: 1)
    visit "/cages/#{cage.id}"

    expect(page).to have_content(cage.title)
    expect(page).to have_content(cage.title)
    expect(page).to have_content(cage.title)
    expect(page).to have_content(cage.title)
  end
end
