require 'rails_helper'

describe "shows a single page" do
  before(:each) do
    @cult = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    @member = @cult.members.create!(name: "Marshall Applewhite", married: true, children: 0)
    @member_2 = @cult.members.create!(name: "Bonnie Nettles", married: true, children: 0)
  end
  it "shows one member name" do
    visit "/members/#{@member.id}"
    expect(page).to have_content(@member.name)
    expect(page).to_not have_content(@member_2.name)
  end

  it "links to the /members page" do
    visit "/members/#{@member.id}"

    expect(page).to have_selector(:link_or_button, "Cultist Index")
    click_link "Cultist Index"
    expect(current_path).to eq("/members")
  end
  it "links to the /members page" do
    visit "/members/#{@member.id}"

    expect(page).to have_selector(:link_or_button, "Cult Index")
    click_link "Cult Index"
    expect(current_path).to eq("/cults")
  end

  it "US 20, Delete child from db." do
    visit "/members/#{@member.id}"

    click_link "Delete #{@member.name}"
    expect(current_path).to eq("/members")
    expect(page).to_not have_content(@member.name)
  end


end
