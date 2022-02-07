class Member < ApplicationRecord
 belongs_to :cult

def self.index
  @index = Member.all
end

def self.boolean
  @bool = Member.find(params[:married][:true])
end
end
