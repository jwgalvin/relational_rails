require 'rails_helper'

describe "index page for members" do
  xit "can see a page with all members" do
    cult = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    cult_2 = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
    member = cult.members.create!(name: "Marshall Applewhite", married: true, children: 0)
    member_2 =cult.members.create!(name: "Bonnie Nettles", married: true, children: 0)
    visit '/cults'
    save_and_open_page
    expect(page).to have_content(var1.attribute)
  end
end
