class CultsController < ApplicationController
  def index
  end

  def show
    @cults = Cult.find(params[:id])
  end

  def new
  end

  def create
    # binding.pry
    cult = Cult.create!({
      name: params[:name],
      member_size: params[:member_size],
      open_enrollment: params[:open_enrollment]
      })
    redirect_to "/cults/#{cult.id}"
  end

  def edit
    # binding.pry
    @cults = Cult.find(params[:id])
  end

  def update
    cult = Cult.find(params[:id])
    cult.update({
      name: params[:cult][:name],
      member_size: params[:cult][:member_size],
      open_enrollment: params[:cult][:open_enrollment]
      })
      #binding.pry
      cult.save
      redirect_to "/cults/#{cult.id}"
  end
end
