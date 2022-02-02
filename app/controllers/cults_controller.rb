class CultsController < ApplicationController
  def index
    @cults = Cult.all
  end

  def create
  end
end
