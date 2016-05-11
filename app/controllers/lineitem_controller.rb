class LineitemController < ApplicationController
  def index
    respond_to do |format|
      format.json {render json: {:lineitems => Lineitem.all.to_json(:include => :item)  }, status: :created}
    end
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

    item = Item.find(params[:item_id])
    @line_item = @cart.add_item(item.id, params[:quantity])

    puts "lineitems", @newcart.inspect
    respond_to do |format|
        if @line_item.save
          format.html { redirect_to @line_item.cart, :notice => 'Success' }
          format.json {render json: {:lineitems => @cart.lineitems.as_json(:include => :item), :total_price => @cart.total_price, :total_items => @cart.total_items }, status: :created}
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
