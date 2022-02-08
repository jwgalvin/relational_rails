class FerretCagesController < ApplicationController
  def index
    @cage = Cage.find(params[:cage_id])
    binding.pry
    @ferrets = @cage.ferrets
  end
end
