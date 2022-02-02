require 'rails_helper'

RSpec.describe Cult, type: :model do
  it {should have_many :members}
end
