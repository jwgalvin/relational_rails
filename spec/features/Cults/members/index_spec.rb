require 'rails_helper'

describe "Cult members index page" do
  before :each do
    @heaven = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    @waco = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
    @marshall = @heaven.members.create!(name: "Marshall Applewhite", married: true, children: 2)
    @bonnie = @heaven.members.create!(name: "Bonnie Nettles", married: true, children: 0)
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
    visit "/cults/#{@heaven.id}/members"
    expect(page).to have_content("Update Member Here")
    click_button 'Add Cult Member'
    #expect(current_path).to eq("/cults/#{@heaven.id}/edit")
  end

  xit "US13, part 2 has can add data via forms" do
    visit "/cults/#{@heaven.id}/edit"
    expect(page).to have_content("Cultist's name:")
    expect(page).to have_content('Children count:')
    expect(page).to have_content('Marital status:')
  end

end
