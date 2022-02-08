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
    @members = @index.where(married: true)
    return @members
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
  def destroy
    member = Member.find(params[:id])
    member.destroy
    redirect_to "/members"
  end
end
