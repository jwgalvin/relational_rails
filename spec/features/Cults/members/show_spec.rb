require 'rails_helper'

describe "shows a single page" do
  it "shows one member name" do
    cult = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    member = cult.members.create!(name: "Marshall Applewhite", married: true, children: 0)
    member_2 =cult.members.create!(name: "Bonnie Nettles", married: true, children: 0)
    visit "/members/#{member.id}"
    expect(page).to have_content(member.name)
    expect(page).to_not have_content(member_2.name)
  end

  it "links to the /members page" do
    visit "/members/#{member.id}"
    save_and_open_page
    #click_button 'Cultist Index'

    expect(page).to have_selector(:link_or_button, "Cultist Index")
  end
end
