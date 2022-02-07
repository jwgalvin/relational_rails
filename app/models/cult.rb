class Cult < ApplicationRecord
  has_many :members

  def average_num_kids
    members.average(:children)
  end

  def count_members
    members.count
  end

  def new

  end

  
end
