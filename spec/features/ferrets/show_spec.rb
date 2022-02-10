require 'rails_helper'

RSpec.describe 'the ferret show page' do
  it 'displays ferret names' do
    cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
    ferret = cage.ferrets.create!(name: "Pabu", is_clean: false, age: 1)
    ferret_2 = cage.ferrets.create!(name: "Loki", is_clean: true, age: 1)
    ferret_3 = cage.ferrets.create!(name: "Thor", is_clean: true, age: 1)
    visit "/ferrets"

    expect(page).to have_content(ferret.name)
  end
end
