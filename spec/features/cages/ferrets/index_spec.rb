require 'rails_helper'

RSpec.describe 'Ferret cage index page' do
  describe 'User story 5' do
    it 'displays cage title' do
      cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
      ferret = cage.ferrets.create!(name: "Pabu", is_clean: false, age: 1)
      ferret_2 = cage.ferrets.create!(name: "Loki", is_clean: true, age: 1)
      ferret_3 = cage.ferrets.create!(name: "Thor", is_clean: true, age: 1)
      visit "/cages/#{cage.id}/ferrets"

      expect(page).to have_content(cage.title)
    end
    it 'displays ferret and attributes' do
      cage = Cage.create!(title: "Stinky Land", is_open: true, ferret_count: 3, ferret_capacity: 5)
      ferret = cage.ferrets.create!(name: "Pabu", is_clean: false, age: 1)
      ferret_2 = cage.ferrets.create!(name: "Loki", is_clean: true, age: 1)
      visit "/cages/#{cage.id}/ferrets"

      expect(page).to have_content(ferret.name)
      expect(page).to have_content(ferret_2.name)
      expect(page).to have_content(ferret.age)
      expect(page).to have_content(ferret_2.age)
    end
  end

  describe 'User stories 8-10' do
    before :each do
      @cage = Cage.create!(title: "Stinky Kingdom", is_open: true, ferret_count: 3, ferret_capacity: 5)
      @ferret = @cage.ferrets.create!(name: "Pabu", is_clean: false, age: 1)
      @ferret_2 = @cage.ferrets.create!(name: "Loki", is_clean: true, age: 1)
    end
    it 'has child index link' do
      visit "/cages"
      expect(page).to have_selector(:link_or_button, "Ferret Index")
    end
    it 'has parent index link' do
      visit "/cages"
      expect(page).to have_selector(:link_or_button, "Cage Index")
    end
    it 'has link to parents child table page' do
      visit "/cages/#{@cage.id}"
      expect(page).to have_selector(:link_or_button, "#{@cage.title}s Ferrets")
    end
  end
end
