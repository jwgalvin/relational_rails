class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
  end

  def new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def index
    @index = Member.all
    @member = @index.where(married: true).pluck
    return @index

    redirect_to "/members"
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
