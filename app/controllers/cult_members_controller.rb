class CultMembersController < ApplicationController

  def index
    cult = Cult.find(params[:cult_id])
    @members = cult.members
  end

end
