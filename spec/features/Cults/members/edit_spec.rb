require 'rails_helper'

describe "Edit cultist page" do
  before :each do
    @heaven = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    @waco = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
    @marshall = @heaven.members.create!(name: "Marshall Applewhite", married: true, children: 2)
    @bonnie = @heaven.members.create!(name: "Bonnie Nettles", married: true, children: 0)
    @david = @waco.members.create!(name: "David Khouresh", married: true, children: 32)
  end

  it "US 14, has a button to go to edit page" do
    visit "/members/#{@marshall.id}"
    click_link "Update Cultist Here"

    expect(current_path).to eq("/members/#{@marshall.id}/edit")
  end

  it "will display a form to collect new data" do
    visit "/members/#{@marshall.id}/edit"
    expect(page).to have_content("Edit member name")
    expect(page).to have_content('Children count:')
    expect(page).to have_content('Marital status:')
  end

  it "it will accept data and go to show page and display changes" do
    visit "/members/#{@marshall.id}/edit"
    fill_in('name', with: 'Marshal Applewhite')
    fill_in('children', with: 6)
    fill_in('married', with: false)

    click_button "Edit Cult Member"

    expect(current_path).to eq("/members/#{@marshall.id}")
    #save_and_open_page
  end

end
