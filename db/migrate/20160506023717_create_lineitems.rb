class CreateLineitems < ActiveRecord::Migration
  def change
    create_table :lineitems do |t|
      t.integer :quantity
      t.integer :item_id
      t.integer :order_id
      t.timestamps null: false
    end
  end
end
