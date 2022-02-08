class Cult < ApplicationRecord
  has_many :members, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :member_size

  def count_members
    members.count
  end

  def new

  end


end
