require 'rails_helper'

describe "shows a single page" do
  it "shows one cult" do
    cult = Cult.create(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
    visit "/cults/#{@cult.id}"

  end

  xit "Shows one Cult member" do


  end
end
