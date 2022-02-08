require 'rails_helper'

RSpec.describe 'Ferret cage index page' do
  xit 'displays cage title' do
    cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
    ferret = cage.ferrets.create!(name: "Pabu", is_clean: false, age: 1)
    ferret_2 = cage.ferrets.create!(name: "Loki", is_clean: true, age: 1)
    ferret_3 = cage.ferrets.create!(name: "Thor", is_clean: true, age: 1)
    visit "/cages/:cage_id/ferrets"

    expect(page).to have_content(cage.title)
  end
  xit 'displays ferret and attributes' do
    cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
    ferret = cage.ferrets.create!(name: "Pabu", is_clean: false, age: 1)
    ferret_2 = cage.ferrets.create!(name: "Loki", is_clean: true, age: 1)
    visit "/cages/:cage_id/ferrets"

    expect(page).to have_content(ferret.title)
    expect(page).to have_content(ferret2.title)
    expect(page).to have_content(ferret.age)
    expect(page).to have_content(ferret2.age)
  end
end
