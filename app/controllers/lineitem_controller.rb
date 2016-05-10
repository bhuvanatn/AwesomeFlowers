class LineitemController < ApplicationController
  def index
  end

  def edit
  end

  def show
  end

  def update
  end

  def create
    puts params.inspect
    @cart = current_cart  #this defined in application_controller.rb
    puts "current cart:"
    puts @cart.inspect
    item = Item.find(params[:item_id])
    @line_item = @cart.add_item(item.id, params[:quantity])
    respond_to do |format|
        if @line_item.save
          format.html { redirect_to @line_item.cart, :notice => 'Success' }
          format.json {render json: @cart.lineitems, status: :created}
        else
          format.html { render :action => "new" }
          format.json {render json: @line_item.errors, :status => :unprocessable_entity }
        end
    end
  end

  def new
  end

  def destroy
  end
end
