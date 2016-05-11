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
o3 = Occasion.create :name => 'New Born'
o4 = Occasion.create :name => 'Sympathy'
o5 = Occasion.create :name => 'Congratulations'
o6 = Occasion.create :name => 'Thank You'

Item.destroy_all
i1 = Item.create :name => 'Sunflower', :description => 'Wow', :image => 'https://allensflowers.files.wordpress.com/2012/07/summer2.jpg', :price => 30, :kind => 'Flowers'
i11 = Item.create :name => 'Sunflower', :description => 'Wow', :image => 'http://www.heavenlycreationflorist.com/wp-content/uploads/2012/04/Sunflower-Bouquet-1825-62.jpg', :price => 30, :kind => 'Flowers'
i12 = Item.create :name => 'Sunflower', :description => 'Wow', :image => 'https://s-media-cache-ak0.pinimg.com/236x/1b/2f/90/1b2f90a28970224ee44a84add56640c6.jpg', :price => 30, :kind => 'Flowers'

i2 = Item.create :name => 'Roses', :description => 'Wow', :image => 'http://www.sendtreat.com/image/data/vases/15%20Red%20Roses%20VASE.jpg', :price => 40, :kind => 'Flowers'
i21 = Item.create :name => 'Roses', :description => 'Wow', :image => 'http://www.bengaluruflorists.com/images/50pinkrosesvase-400x400.jpg', :price => 40, :kind => 'Flowers'
i22 = Item.create :name => 'Roses', :description => 'Wow', :image => 'http://www.westendflorists.com/images/christmas/Ice_White_Bouquet.jpg', :price => 40, :kind => 'Flowers'


i3 = Item.create :name => 'Lily', :description => 'Wow', :image => 'http://cdn1.1800flowers.com/wcsstore/Flowers/images/catalog/107003sv2z.jpg', :price => 50, :kind => 'Flowers'
i31 = Item.create :name => 'Lily', :description => 'Wow', :image => 'http://www.flowersforeveryone.com.au/images/products/large/pastel-pink-lush-bouquet-flower-bouquets.jpg', :price => 50, :kind => 'Flowers'
i32 = Item.create :name => 'Lily', :description => 'Wow', :image => 'http://www.flowerslink.com.au/images/Mix-tiger-lily.jpg', :price => 50, :kind => 'Flowers'

i6 = Item.create :name => 'TeddyBear', :description => 'Wow', :image => 'http://www.goodlightscraps.com/content/teddy-bear/teddy-bear-7.jpg', :price => 50, :kind =>'Gift'
i7 = Item.create :name => 'Chocolates', :description => 'Wow', :image => 'http://www.olympiacandy.com/uploadmedia/images/milk-chocolate-gift-box-5-lbs-751-L.jpg', :price => 50, :kind =>'Gift'
i8 = Item.create :name => 'Wine', :description => 'Wow', :image => 'http://www.tanners-wines.co.uk/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/z/s/zs1064.jpg', :price => 50, :kind =>'Gift'
i9 = Item.create :name => 'Ballowns', :description => 'Wow', :image => 'http://teleflora.edgesuite.net/images/products/HW0_258129.jpg', :price => 50, :kind => 'Gift'
i10 = Item.create :name => 'Cards', :description => 'Wow', :image => 'https://tidyandco.com/wp-content/uploads/2014/11/Happy-birthday-to-you-gift-card.jpg', :price => 50, :kind => 'Gift'


# adding Flowers to Birthday occasions
o1.items << i1
o1.items << i2
o1.items << i21
o1.items << i22
o1.items << i3
o1.items << i31
o1.items << i32
#adding gifts to Birthdayoccasions
o1.items << i6
o1.items << i7
o1.items << i8
o1.items << i9
o1.items << i10

# adding Flowers to Anniversary occasions
o2.items << i1
o2.items << i11
o2.items << i12
o2.items << i2
o2.items << i21
o2.items << i22
o2.items << i3
# adding gifts to Anniversaryoccasions
o2.items << i6
o2.items << i7
o2.items << i8
o2.items << i9
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

li6 = Lineitem.create :quantity => 1
li7 = Lineitem.create :quantity => 2
li8 = Lineitem.create :quantity => 1
li9 = Lineitem.create :quantity => 4
li10 = Lineitem.create :quantity => 5

li6.update(:item => i1)
li7.update(:item => i2)
li8.update(:item => i6)
li9.update(:item => i7)
li10.update(:item => i21)

Cart.destroy_all
ct1 = Cart.create
ct1.lineitems << li6 << li7 << li8 << li9 << li10
u2.update(:cart => ct1)


li1.update(:item => i1)
li2.update(:item => i2)
# li3.update(:item => i4)
li4.update(:item => i6)
# li5.update(:item => i5)

ord1.lineitems << li1
ord2.lineitems << li2
ord3.lineitems << li3 << li4
ord4.lineitems << li5

u1.orders << ord1
u1.orders << ord2
u2.orders << ord3 << ord4
