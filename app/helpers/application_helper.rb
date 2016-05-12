module ApplicationHelper

  def current_cart
    begin
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      # need to set cart.user_id = session[:user_id]
      session[:cart_id] = cart.id
      cart
    end
  end


end
