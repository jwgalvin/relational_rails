require 'rails_helper'

RSpec.describe Ferret do
  describe 'relationships' do
    it { should belong_to :cage }
  end
end
