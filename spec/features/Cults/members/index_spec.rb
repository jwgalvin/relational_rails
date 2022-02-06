require 'rails_helper'

describe "Cult members index page" do
  before :each do
    @heaven = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    @waco = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
    @marshall = @heaven.members.create!(name: "Marshall Applewhite", married: true, children: 2)
    @bonnie = @heaven.members.create!(name: "Bonnie Nettles", married: true, children: 0)
    @david = @waco.members.create!(name: "David Khouresh", married: true, children: 32)
  end

  it "can see a page with all members" do
    visit "cults/#{@heaven.id}/members"
    # save_and_open_page

    expect(page).to have_content("Cultist Index")
    expect(page).to have_content(@marshall.name)
    expect(page).to have_content(@bonnie.name)
    expect(page).to_not have_content(@david.name)
  end

  it "links to each cultist" do
    visit "cults/#{@heaven.id}/members"

    expect(page).to have_selector(:link_or_button, @marshall.name)
    click_on @marshall.name
    expect(current_path).to eq("/members/#{@marshall.id}")
  end

  it "includes data from each cultist" do
    visit "/cults/#{@heaven.id}/members"

    expect(page).to have_content(@marshall.name)
    expect(page).to have_content(@marshall.married)
    expect(page).to have_content(@marshall.children)
    expect(page).to have_content(@marshall.created_at)
    expect(page).to have_content(@marshall.updated_at)
  end

  it "links to the /members page" do
    visit "/cults/#{@heaven.id}/members"
    #save_and_open_page

    expect(page).to have_selector(:link_or_button, "Cultist Index")
    click_button 'Cultist Index'
    expect(current_path).to eq("/cults/#{@heaven.id}/members")
  end

  it "US 13, part 1 add member button" do
    visit "/cults/#{@waco.id}/members"
    expect(page).to have_content("Add Cult Member")
    click_link 'Add Cult Member'
    save_and_open_page
    expect(current_path).to eq("/cults/#{@waco.id}/members/new")
  end

  it "US13, part 2 has has correct labels" do
    visit "/cults/#{@waco.id}/members/new"
    expect(page).to have_content("Cultist name:")
    expect(page).to have_content('Children count:')
    expect(page).to have_content('Marital status:')
  end

  it "US13, part has can add member data via forms" do
    visit "/cults/#{@waco.id}/members/new"
    fill_in('name' , with: 'Vernon Howell')
    fill_in('children', with: 13)
    fill_in('married', with: true)

    click_button 'Create Cult Member'

    new_member_id = Member.last.id
    expect(current_path).to eq("/cults/#{new_member_id}")
    expect(page).to have_content("Vernon Howell")
  end
end
