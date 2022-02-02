require 'rails_helper'

describe "index page for members" do
  xit "can see a page with all members" do
    var1= Member.create(attributes:values)

    visit '/members'
    save_and_open_page
    expect(page).to have_content(var1.attribute)
  end
end
