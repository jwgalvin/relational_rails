require 'rails_helper'

describe "Cult members index page" do
  before :each do
    @heaven = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    @waco = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
    @marshall = @heaven.members.create!(name: "Marshall Applewhite", married: true, children: 2)
    @bonnie = @heaven.members.create!(name: "Bonnie Nettles", married: true, children: 0)
    @nonnie = @heaven.members.create!(name: "Nonnie Bettles", married: false, children: 5)
    @david = @waco.members.create!(name: "David Khouresh", married: true, children: 32)
  end

  it "can see a page with all members" do
    visit "cults/#{@heaven.id}/members"
    # save_and_open_page

    expect(page).to have_content("Cultist Index")
    expect(page).to have_content(@marshall.name)
    expect(page).to have_content(@bonnie.name)
    expect(page).to_not have_content(@david.name)
  end

  it "links to each cultist" do
    visit "cults/#{@heaven.id}/members"

    expect(page).to have_selector(:link_or_button, @marshall.name)
    click_on @marshall.name
    expect(current_path).to eq("/members/#{@marshall.id}")
  end

  it "includes data from each cultist" do
    visit "/cults/#{@heaven.id}/members"

    expect(page).to have_content(@marshall.name)
    expect(page).to have_content(@marshall.married)
    expect(page).to have_content(@marshall.children)
    expect(page).to have_content(@marshall.created_at)
    expect(page).to have_content(@marshall.updated_at)
  end

  it "links to the /members page" do
    visit "/cults/#{@heaven.id}/members"
    #save_and_open_page

    expect(page).to have_selector(:link_or_button, "Cultist Index")
    click_button 'Cultist Index'
    expect(current_path).to eq("/cults/#{@heaven.id}/members")
  end

  it "US 13, part 1 add member button" do
    visit "/cults/#{@waco.id}/members"
    expect(page).to have_content("Add Cult Member")
    click_link 'Add Cult Member'
    # save_and_open_page
    expect(current_path).to eq("/cults/#{@waco.id}/members/new")
  end

  it "US13, part 2 has has correct labels" do
    visit "/cults/#{@waco.id}/members/new"
    expect(page).to have_content("Cultist name:")
    expect(page).to have_content('Children count:')
    expect(page).to have_content('Marital status:')
  end

  it "US13, part 3 has can add member data via forms" do
    visit "/cults/#{@waco.id}/members/new"
    fill_in('name' , with: 'Vernon Howell')
    fill_in('children', with: 13)
    fill_in('married', with: true)

    click_button 'Create Cult Member'

    expect(current_path).to eq("/cults/#{@waco.id}/members")
    expect(page).to have_content("Vernon Howell")
  end

  it "US 15, displays only true records" do
    visit "/members"

    expect(page).to have_content("Marshall Applewhite")
    expect(page).to have_content("Bonnie Nettles")
    expect(page).to_not have_content("Nonnie Bettles")
  end
  it "US16, p1 there is a sort by abc button on the page" do
    visit "/cults/#{@heaven.id}/members"

    # save_and_open_page
    expect(page).to have_button("Sort Cults Alphabetically")
  end

  it "US16, p2 toggling sort button makes it abc" do
    visit "/cults/#{@heaven.id}/members"
    click_link "Sort Cults Alphabetically"

    expect(@bonnie.name).to appear_before(@marshall.name)
    expect(@marshall.name).to appear_before(@nonnie.name)
  end

  it "US 21, display records over given threshold" do
      visit "/cults/#{@heaven.id}/members"
      fill_in ('children', 4)
      click_link "Find the breeders!"
      expect(page).to have_content(@nonnie.name)
      expect(page).to_not have_content(@marshall.name)
  end
end
