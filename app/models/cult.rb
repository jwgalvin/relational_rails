class Cult < ApplicationRecord
  has_many :members

  def average_num_kids
    members.average(:children)
  end

  def cult_count
    Cult.count
  end

  
end
