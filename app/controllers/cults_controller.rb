class CultsController < ApplicationController
  def index
    @cults = Cult.all
  end

  def show
    @cults = Cult.find(params[:id])
  end
  def new
  end

  def create
    cult = Cult.create!({
      name: params[:cult][:name],
      member_size: params[:cult][:member_size],
      open_enrollment: params[:cult][:open_enrollment]
      })
    redirect_to '/cults'
  end

  def edit
    @cults = Cult.find(params[:id])
  end
end
