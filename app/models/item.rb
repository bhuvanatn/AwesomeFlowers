class Item < ActiveRecord::Base
    has_and_belongs_to_many :occasions
    has_many :lineitems
end
