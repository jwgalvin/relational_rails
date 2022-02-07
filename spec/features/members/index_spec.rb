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
    visit "/members"
    #save_and_open_page

    expect(page).to have_content("Worldwide Cultist Index")
    expect(page).to have_content(@marshall.name)
    expect(page).to have_content(@bonnie.name)
  end

  it "links to each cultist" do
    visit "/members"
    click_link("#{@david.name}")
    expect(current_path).to eq("/members/#{@david.id}")
  end

  it "includes data from each cultist" do
    visit "/members"
    #save_and_open_page
    expect(page).to have_content(@marshall.name)
    expect(page).to have_content(@bonnie.married)
    expect(page).to have_content(@david.children)
    expect(page).to have_content(@marshall.created_at)
    expect(page).to have_content(@bonnie.updated_at)
  end

  it "links to the /members page" do
    visit "/members"
    #save_and_open_page
    #click_button 'Cultist Index'
    expect(page).to have_selector(:link_or_button, "Cultist Index")
  end
  it "links to the /members page" do
    visit "/members"
    # save_and_open_page
    expect(page).to have_selector(:link_or_button, "Cult Index")
    click_link('Cult Index')
    expect(current_path).to eq('/cults')
  end
  it "has a button that leads to edit page" do
    visit "/members"

    click_link "Update #{@marshall.name} here"
    expect(current_path).to eq("/members/#{@marshall.id}/edit")
  end


end
