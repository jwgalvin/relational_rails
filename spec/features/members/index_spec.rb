require 'rails_helper'

describe "Cult members index page" do
  before :each do
    @cult = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    @cult_2 = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
    @marshall = @cult.members.create!(name: "Marshall Applewhite", married: true, children: 2)
    @member_2 = @cult.members.create!(name: "Bonnie Nettles", married: true, children: 0)
    @member_3 = @cult_2.members.create!(name: "David Khouresh", married: true, children: 32)
  end

  it "can see a page with all members" do
    # binding.pry
    visit "/members"
    save_and_open_page

    expect(page).to have_content("Worldwide Cultist Index")
    expect(page).to have_content(@marshall.name)
    expect(page).to have_content(@member_2.name)
  end

  it "links to each cultist" do
    visit "/members"

    click_on @marshall.name
    expect(current_path).to eq("/members/#{@marshall.id}")
  end
  it "links to each cultist" do
    visit "/members"
    click_on @member_2.name
    expect(current_path).to eq("/members/#{@member_2.id}")
  end
  it "links to each cultist" do
    visit "/members"
    click_on @member_3.name
    expect(current_path).to eq("/members/#{@member_3.id}")
  end

  it "includes data from each cultist" do
    visit "/members"
    save_and_open_page
    expect(page).to have_content(@marshall.name)
    expect(page).to have_content(@member_2.married)
    expect(page).to have_content(@member_3.children)
    expect(page).to have_content(@marshall.created_at)
    expect(page).to have_content(@member_2.updated_at)
  end
end
