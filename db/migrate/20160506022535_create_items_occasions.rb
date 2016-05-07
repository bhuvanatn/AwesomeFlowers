class CreateItemsOccasions < ActiveRecord::Migration
  def change
    create_table :items_occasions do |t|
      t.integer :occasion_id
      t.integer :item_id
      t.timestamps null: false
    end
  end
end
