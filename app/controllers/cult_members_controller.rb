class CultMembersController < ApplicationController

  def index
    @cults = Cult.find(params[:id])
    @members = @cults.members
  end

  def new
  end

  def create
    @cults = Cult.find(params[:id])
    # binding.pry
    member = @cults.members.create!({
      name: params[:member][:name],
      children: params[:member][:children],
      married: params[:member][:married]
      })
    redirect_to "/cults/#{@cults.id}/members/"
  end
end
