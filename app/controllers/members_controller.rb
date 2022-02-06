class MembersController < ApplicationController
  def index
    @member = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    member = Member.find(params[:id])
    member.update!({
      name: params[:name],
      married: params[:married],
      children: params[:children]
      })
      #binding.pry
      member.save
      redirect_to "/members/#{member.id}"
  end
end
