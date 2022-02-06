class CultMembersController < ApplicationController

  def index
    @cults = Cult.find(params[:id])
    @members = @cults.members
    # binding.pry
  end

  def new
    @cults = Cult.find(params[:id])
  end

  def create
    cult = Cult.find(params["id"])
    member = cult.members.create!({
      name: params[:name],
      children: params[:children],
      married: params[:married]
      })
    redirect_to "/cults/#{cult.id}/members"
  end
end
