class CultsController < ApplicationController
  def index
    @cults = Cult.all
  end

  def show
    @cults = Cult.find(params[:id])
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
    @cults = Cult.find(params[:id])
  end
end
