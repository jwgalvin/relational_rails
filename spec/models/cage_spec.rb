require 'rails_helper'

RSpec.describe Cage do
  describe 'relationships' do
    it { should have_many :ferrets }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :ferret_count }
    it { should validate_presence_of :ferret_capacity }
    # it { should validate_inclusion_of(is_open).in_array([true, false]) }
  end
end
