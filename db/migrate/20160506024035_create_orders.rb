class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.money :totalprice
      t.timestamps null: false
    end
  end
end
