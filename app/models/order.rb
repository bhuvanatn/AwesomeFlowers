class Order < ActiveRecord::Base
  belongs_to :user
  has_many :lineitems

  def add_line_items_from_cart(cart)
    cart.lineitems.each do |lineitem|
      lineitem.cart_id = nil
      lineitems << lineitem
    end
  end

end
