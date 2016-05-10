class AddCartIdToLineitem < ActiveRecord::Migration
  def change
    add_column :lineitems, :cart_id, :integer
  end
end
