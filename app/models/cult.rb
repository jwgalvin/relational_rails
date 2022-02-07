class Cult < ApplicationRecord
  has_many :members

  def average_num_kids
    members.average(:children)
  end

  def count_members
    # binding.pry
    members.count
  end


end
