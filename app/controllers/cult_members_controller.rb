class CultMembersController < ApplicationController

  def index
    @cults = Cult.find(params[:id])
    if params[:sort]
      @members = @cults.members.order(name: :asc)
    elsif params[:number]
      @members = @cults.members.where('children > ?', params[:number])
    else
      @members = @cults.members
    end
  end

  # def show
  #   @cults = Cult.find(params[:id])
  #   @members = @cults.members
  # end

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
