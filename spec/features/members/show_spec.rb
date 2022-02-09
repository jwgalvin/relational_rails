require 'rails_helper'

describe "shows a single page" do

  before(:each) do
    @cult = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    @member = @cult.members.create!(name: "Marshall Applewhite", married: true, children: 0)
    @member_2 = @cult.members.create!(name: "Bonnie Nettles", married: true, children: 0)
  end
  it "shows one member name" do
    visit "/members/#{@member.id}"
    #save_and_open_page
    expect(page).to have_content(@member.name)
    expect(page).to have_content(@member.married)
    expect(page).to have_content(@member.created_at)
    expect(page).to have_content(@member.updated_at)
    expect(page).to have_content(@member.children)
    expect(page).to_not have_content(@member_2.name)
  end

  it "links to the /members page" do
    visit "/members/#{@member.id}"

    expect(page).to have_selector(:link_or_button, "Cultist Index")
  end
  it "links to the /cult index" do
    visit "/members/#{@member.id}"

    expect(page).to have_selector(:link_or_button, "Cult Index")
    click_link "Cult Index"
    expect(current_path).to eq("/cults")
  end

  it "links to the /cult members" do
    visit "/cults/#{@cult.id}"

    expect(page).to have_selector(:link_or_button, "#{@cult.name} Member's Index")
    click_link "#{@cult.name} Member's Index"
    expect(current_path).to eq("/cults/#{@cult.id}/members")
  end
end
