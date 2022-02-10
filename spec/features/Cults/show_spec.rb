require 'rails_helper'

describe "shows a Cult per page" do
  before(:each) do
    @heaven = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    @waco = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
    @marshall = @heaven.members.create!(name: "Marshall Applewhite", married: true, children: 0)
    @bonnie = @heaven.members.create!(name: "Bonnie Nettles", married: true, children: 0)
    @thomas = @heaven.members.create!(name: "Thomas Nichols", married: false, children: 3)
  end
  it "Shows one Cult" do
    visit "/cults/#{@heaven.id}"
    expect(page).to have_content(@heaven.name)
    expect(page).to have_content(@heaven.member_size)
    expect(page).to have_content(@heaven.open_enrollment)
    expect(page).to have_content(@heaven.created_at)
    expect(page).to have_content(@heaven.updated_at)
    expect(page).to_not have_content(@waco.name)
  end

  it "displays the number of members at the bottom of the page." do

    visit "/cults/#{@heaven.id}"
    expect(@heaven.count_members).to eq(3)
    expect(page).to have_content("There are 3 cultist listed.")
  end

  it "links to the /members page" do
    visit "/cults/#{@heaven.id}"
    click_link "Cultist Index"
    expect(current_path).to eq("/members")
  end

  it "links to the /members page" do
    visit "/cults/#{@heaven.id}"
    click_link "Cult Index"
    expect(current_path).to eq("/cults")
  end

  it "US 12, part 1 update parent button" do
    visit "/cults/#{@heaven.id}"
    click_link "Update Cult Here"
    expect(current_path).to eq("/cults/#{@heaven.id}/edit")
  end

  it "US12, part 2 has edit content on the page" do
    visit "/cults/#{@heaven.id}/edit"
    expect(page).to have_content('Edit cult name:')
    expect(page).to have_content('Member size:')
    expect(page).to have_content('Open enrollment:')
  end


  it "US 19, Delete parent from parent show page." do
    visit "/cults/#{@heaven.id}"
    click_link "Delete #{@heaven.name}"
    expect(current_path).to eq("/cults")
    expect(page).to_not have_content(@heaven.name)
  end

end
