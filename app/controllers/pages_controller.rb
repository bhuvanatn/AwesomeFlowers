class PagesController < ApplicationController
  def welcome
   @occasion = Occasion.find(7)
    # redirect_to occasions_path
    # raise "Hell"
  end
  def show
    @occasion = Occasion.find params[:id]
  end
end
