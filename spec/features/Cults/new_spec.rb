require 'rails_helper'

describe "US 11, will create a new cult" do
  before(:each) do
    @heaven = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    @waco = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
    @science = Cult.create!(name: "Scientology", member_size: 4000)
    @marshall = @heaven.members.create!(name: "Marshall Applewhite", married: true, children: 0)
    @bonnie = @heaven.members.create!(name: "Bonnie Nettles", married: true, children: 0)
  end

  it "US 11, P1: Link to create a new parent" do
    visit "/cults"
    expect(page).to have_selector(:link_or_button, "New Cult")
    click_link('New Cult')
    save_and_open_page
    expect(current_path).to eq('/cults/new')
  end

  it "US 11, P2: creates a new cult and adds to the db" do
    visit "/cults/new"
    fill_in('name', with: '4chan')
    fill_in('member_size', with: 200000)
    fill_in('open_enrollment', with: true)

    click_button 'Create Cult'

    new_cult_id = Cult.last.id
    expect(current_path).to eq("/cults/#{new_cult_id}")
    expect(page).to have_content("4chan")
    #save_and_open_page
  end
end
