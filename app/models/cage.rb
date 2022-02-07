class Cage < ApplicationRecord
  has_many :ferrets
  validates_presence_of :title
  validates_presence_of :ferret_count
  validates_presence_of :ferret_capacity
  # validates_inclusion_of(:is_open).in_array([true, false])
end
