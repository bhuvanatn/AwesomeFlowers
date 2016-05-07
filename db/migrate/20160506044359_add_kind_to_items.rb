class AddKindToItems < ActiveRecord::Migration
  def change
    add_column :items, :kind, :text
  end
end
