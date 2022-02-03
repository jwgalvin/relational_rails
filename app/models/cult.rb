class Cult < ApplicationRecord
  has_many :members

  def average_num_kids
    avg = self.members.average(:children)
    avg
  end
end
