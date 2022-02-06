require 'rails_helper'

describe "index page for Cults" do
  before(:each) do
    @heaven = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    @waco = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
    @science = Cult.create!(name: "Scientology", member_size: 4000)
    @marshall = @heaven.members.create!(name: "Marshall Applewhite", married: true, children: 0)
    @bonnie = @heaven.members.create!(name: "Bonnie Nettles", married: true, children: 0)
  end
  it "can see a page with all members" do

    visit '/cults'
    #save_and_open_page
    expect(@science.name).to appear_before(@waco.name)
    expect(@waco.name).to appear_before(@heaven.name)
  end
end
describe "it has a button for cultist index." do
  before(:each) do
    @heaven = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    @waco = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
    @science = Cult.create!(name: "Scientology", member_size: 4000)
    @marshall = @heaven.members.create!(name: "Marshall Applewhite", married: true, children: 0)
    @bonnie = @heaven.members.create!(name: "Bonnie Nettles", married: true, children: 0)
  end

  it "links to the /members page" do
    visit "/cults"
    #save_and_open_page
    #click_button 'Cultist Index'

    expect(page).to have_selector(:link_or_button, "Cultist Index")
  end
end
describe "it has a button for cultist index." do
    before(:each) do
      @heaven = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
      @waco = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
      @science = Cult.create!(name: "Scientology", member_size: 4000)
      @marshall = @heaven.members.create!(name: "Marshall Applewhite", married: true, children: 0)
      @bonnie = @heaven.members.create!(name: "Bonnie Nettles", married: true, children: 0)
    end

    it "links to the /members page" do
      visit "/cults"
      #save_and_open_page
      #click_on 'Cultist Index'

      expect(page).to have_selector(:link_or_button, "Cult Index")
    end
  
end
