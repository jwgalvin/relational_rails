require 'rails_helper'

describe "shows a Cult per page" do
  it "Shows one Cult" do
    cult = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    cult_2 = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
    member = cult.members.create!(name: "Marshall Applewhite", married: true, children: 0)
    member_2 = cult.members.create!(name: "Bonnie Nettles", married: true, children: 0)
    # binding.pry
    visit "/cults/#{cult.id}"
    expect(page).to have_content(cult.name)
    expect(page).to_not have_content(cult_2.name)
  end
end
