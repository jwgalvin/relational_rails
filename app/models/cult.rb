class Cult < ApplicationRecord
  has_many :members, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :member_size

  def average_num_kids
    members.average(:children)
  end

  def count_members
    members.count
  end

  def new

  end


end
