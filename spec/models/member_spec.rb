require 'rails_helper'

RSpec.describe Member, type: :model do
  it {should belong_to :cult}
end
