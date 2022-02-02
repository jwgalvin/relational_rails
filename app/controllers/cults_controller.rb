class CultsController < ApplicationController
  def index
    @cults = Cult.all
  end

  def create
  end

  def show

  end
end
