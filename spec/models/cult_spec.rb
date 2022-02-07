require 'rails_helper'

RSpec.describe Cult, type: :model do
  it {should have_many :members}

  describe 'instance methods' do
    describe '#average_num_kids' do
      before :each do
        @cult = Cult.create!(name: "Heaven's Gate", member_size: 323, open_enrollment: true)
        @cult_2 = Cult.create!(name: "Branch Davidian", member_size: 42, open_enrollment: false)
        @marshall = @cult.members.create!(name: "Marshall Applewhite", married: true, children: 2)
        @member_2 = @cult.members.create!(name: "Bonnie Nettles", married: true, children: 0)
        @member_3 = @cult.members.create!(name: "David Khouresh", married: true, children: 32)
      end

      xit "gives the average number of kids" do
        expect(@cult.average_num_kids.round(2)).to eq(11.33)
      end

      xit "will test .cult_count" do
        # binding.pry

        expect(self.cult_count).to eq(2)
      end
    end

  end


end
