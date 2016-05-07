class Lineitem < ActiveRecord::Base
  # belongs_to :items
  belongs_to :order
  belongs_to :item

end
