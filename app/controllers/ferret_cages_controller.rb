class FerretCagesController < ApplicationController
  def index
    @cage = Cage.find(params[:cage_id])
    @ferrets = @cage.ferrets
  end
end
