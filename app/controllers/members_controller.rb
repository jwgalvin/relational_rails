class MembersController < ApplicationController
  def index
    @member = Member.all
  end

  def show
    #binding.pry
    @member = Member.find(params[:id])
  end

  # def create
  #   member = Member.new({
  #
  #     })
  #     task.save
  #     redirect_to '/members'
  # end

  def new
  end

  def edit
    @member = Member.find(params[:id])
  end
end
