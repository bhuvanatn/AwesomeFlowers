# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
u1 = User.create :email => 'atom@ga.co', :password => 'ripple', :password_confirmation => 'ripple'
u2 = User.create :email => 'electron@ga.co', :password => 'ripple', :password_confirmation => 'ripple'
u3 = User.create :email => 'proton@ga.co', :password => 'ripple', :password_confirmation => 'ripple'

Occasion.destroy_all
o1 = Occasion.create :name => 'Birthday'
o2 = Occasion.create :name => 'Anniversary'
o3 = Occasion.create :name => 'New Born Baby'

Item.destroy_all
i1 = Item.create :name => 'BYellowFlrs', :description => 'Wow', :price => 30, :kind => 'Flowers'
i2 = Item.create :name => 'BPinkFlrs', :description => 'Wow', :price => 40, :kind => 'Flowers'
i3 = Item.create :name => 'BRedFlrs', :description => 'Wow', :price => 50, :kind => 'Flowers'
i4 = Item.create :name => 'BlilyFlrs', :description => 'Wow', :price => 50, :kind => 'Flowers'
i5 = Item.create :name => 'BDaisyFlrs', :description => 'Wow', :price => 50, :kind => 'Flowers'

i6 = Item.create :name => 'TiddyBear', :description => 'Wow', :price => 50, :kind =>'Gift'
i7 = Item.create :name => 'Chocolates', :description => 'Wow', :price => 50, :kind =>'Gift'
i8 = Item.create :name => 'Wine', :description => 'Wow', :price => 50, :kind =>'Gift'
i9 = Item.create :name => 'Ballowns', :description => 'Wow', :price => 50, :kind => 'Gift'
i10 = Item.create :name => 'Cards', :description => 'Wow', :price => 50, :kind => 'Gift'

# adding Flowers to Birthday occasions
o1.items << i1
o1.items << i2
o1.items << i3
o1.items << i4
#adding gifts to Birthdayoccasions
o1.items << i6
o1.items << i7
o1.items << i9

# adding Flowers to Anniversary occasions
o2.items << i2
o2.items << i3
o2.items << i4
o3.items << i5
# adding gifts to Anniversaryoccasions
o2.items << i8
o2.items << i10

Order.destroy_all
ord1 = Order.create :totalprice => 40.0
ord2 = Order.create :totalprice => 50.0
ord3 = Order.create :totalprice => 60.0
ord4 = Order.create :totalprice =>200.0

# er  "quantity"
# t.integer  "item_id"
# t.integer  "order_id"

li1 = Lineitem.create :quantity => 1
li2 = Lineitem.create :quantity => 2
li3 = Lineitem.create :quantity => 1
li4 = Lineitem.create :quantity => 4
li5 = Lineitem.create :quantity => 5


li1.update(:item => i1)
li2.update(:item => i2)
li3.update(:item => i4)
li4.update(:item => i6)
li5.update(:item => i5)

ord1.lineitems << li1
ord2.lineitems << li2
ord3.lineitems << li3 << li4
ord4.lineitems << li5

u1.orders << ord1
u1.orders << ord2
u2.orders << ord3 << ord4
