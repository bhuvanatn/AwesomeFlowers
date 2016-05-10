class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :lineitems

  def add_item(item_id, quantity)
    current_item = lineitems.find_by_item_id(item_id)
    if current_item
      current_item.quantity += quantity.to_i
    else
      current_item = lineitems.build(:item_id => item_id, :quantity => quantity)
    end
    current_item
  end

end
