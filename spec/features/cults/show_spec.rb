require 'rails_helper'

describe "shows a single page" do
  it "shows one cult" do
    cult = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    member = cult.members.create!(name: "Marshall Applewhite", married: true, children: 0)
    member_2 = cult.members.create!(name: "Bonnie Nettles", married: true, children: 0)
    visit "/cults/#{cult.id}"
    expect(page).to have_content(cult.name)
  end

  xit "Shows one Cult member" do
    cult = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    member = Member.create!(name: "Marshall Applewhite", married: true, children: 0)
    member_2 = Member.create!(name: "Bonnie Nettles", married: true, children: 0)
    visit "/cults/#{}"
  end
end
