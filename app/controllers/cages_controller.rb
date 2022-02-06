class CagesController < ApplicationController
  def index
    @cages = Cage.all
  end

  def show
    @cage = Cage.find(params[:id])
  end
end
