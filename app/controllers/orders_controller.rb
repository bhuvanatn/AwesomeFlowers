class OrdersController < ApplicationController
  def index
  end

  def new

    @cart = current_cart
    if @cart.lineitems.empty?
      redirect_to root_path, :notice => "Your cart is empty"
      return
    end

    @order = Order.new
  end


  def create

    begin
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => (current_cart.total_price * 100).to_i,
        :description => 'Rails Stripe customer',
        :currency    => 'aud'
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path
    end

    # create an order from cart lineitems
    @order = Order.new
    @order.add_line_items_from_cart(current_cart)
    @order.user_id = @current_user.id
    @order.totalprice = current_cart.total_price

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path, flash: {notice: "Thank you for your order!"}
    else
      redirect_to root_path, flash: {notice: "Error saving order!"}
    end

  end

  def update
  end

  def destroy
  end
end
