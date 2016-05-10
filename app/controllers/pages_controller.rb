class PagesController < ApplicationController
  def welcome
    @occbar = Occasion.all
  end
end
