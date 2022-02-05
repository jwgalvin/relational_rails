require 'rails_helper'

describe "shows a Cult per page" do
  #This test Clickable cult name
  before(:each) do
    @heaven = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    @waco = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
    @marshall = @heaven.members.create!(name: "Marshall Applewhite", married: true, children: 0)
    @bonnie = @heaven.members.create!(name: "Bonnie Nettles", married: true, children: 0)
    @thomas = @heaven.members.create!(name: "Thomas Nichols", married: false, children: 3)
  end
  it "Shows one Cult" do
    visit "/cults/#{@heaven.id}"
    #save_and_open_page
    expect(page).to have_content(@heaven.name)
    expect(page).to have_content(@heaven.member_size)
    expect(page).to have_content(@heaven.open_enrollment)
    expect(page).to have_content(@heaven.created_at)
    expect(page).to have_content(@heaven.updated_at)
    expect(page).to_not have_content(@waco.name)
  end

    it "displays the number of members at the bottom of the page." do

    visit "/cults/#{@heaven.id}"
    #save_and_open_page
    expect(@heaven.count_members).to eq(3)
    expect(page).to have_content("There are 3 cultist listed.")
  end

  it "links to the /members page" do
    visit "/cults/#{@heaven.id}"
    #save_and_open_page
    #click_button 'Cultist Index'

    expect(page).to have_selector(:link_or_button, "Cultist Index")
  end
  it "links to the /members page" do
    visit "/cults/#{@heaven.id}"
    #save_and_open_page
    #click_button 'Cultist Index'

    expect(page).to have_selector(:link_or_button, "Cult Index")
  end
end
