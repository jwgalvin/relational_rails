class CultsController < ApplicationController
  def index
    @cults= Cult.all
  end

  def show
    @cults = Cult.find(params[:id])
    # binding.pry
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

  # def cult_params
  #   params.permit(:name)
  # end

  def update
    cult = Cult.find(params[:id])
    cult.update({
      name: params[:name],
      member_size: params[:member_size],
      open_enrollment: params[:open_enrollment]
      })
      redirect_to "/cults/#{cult.id}"
  end

  def destroy
    cult = Cult.find(params[:id])
    cult.destroy
    redirect_to "/cults"
  end
end
