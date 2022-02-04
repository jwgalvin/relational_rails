require 'rails_helper'

describe "shows a Cult per page" do
  #This test Clickable cult name
  it "Shows one Cult" do
    cult = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    cult_2 = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
    member = cult.members.create!(name: "Marshall Applewhite", married: true, children: 0)
    member_2 = cult.members.create!(name: "Bonnie Nettles", married: true, children: 0)
    visit "/cults/#{cult.id}"
    save_and_open_page
    expect(page).to have_content(cult.name)
    expect(page).to have_content(cult.member_size)
    expect(page).to have_content(cult.open_enrollment)
    expect(page).to have_content(cult.created_at)
    expect(page).to have_content(cult.updated_at)
    expect(page).to_not have_content(cult_2.name)
  end
end
