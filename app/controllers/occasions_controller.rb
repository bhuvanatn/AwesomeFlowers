class OccasionsController < ApplicationController

  

  def new
    @occasion = Occasion.new
  end

  def index
    @occasion = Occasion.all

  end



  def create
      occasion = Occasion.create occasion_params
      redirect_to occasions_path
    end

    def update
      occasion = Occasion.find params[:id]
      occasion.update occasion_params
      redirect_to occasion
    end

    def edit
      @occasion = Occasion.find params[:id]
    end

    def show
      @occasion = Occasion.find params[:id]
    end

    def destroy
      occasion = Occasion.find params[:id]
      occasion.destroy
      redirect_to occasions_path
    end

    private
    def occasion_params
      params.require(:occasion).permit(:name)
    end
  end
