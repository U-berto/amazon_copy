require "open-uri"

Review.destroy_all
OrderItem.destroy_all
Order.destroy_all
CartItem.destroy_all
Item.destroy_all
User.destroy_all


# 2) Create Users
seller = User.create!(
  email: "jeff-besos@fake-amazon.com",
  password: "securepassword",
  first_name: "Jeff",
  last_name: "Besos",
  address: "1 Endless Loop"
)

seller_b = User.create!(
  email: "steve_jobs@apple.it",
  password: "securepassword",
  first_name: "Steve",
  last_name: "Jobs",
  address: "2 Endless Loops"
)

buyer_1 = User.create!(
  email: "bananaLoca@lewagon.com",
  password: "securepassword",
  first_name: "banana",
  last_name: "Loca",
  address: "Diputacion"
)

buyer_2 = User.create!(
  email: "j-medical@juventus.com",
  password: "securepassword",
  first_name: "Douglas",
  last_name: "Luiz",
  address: "casa-tua"
)

buyer_3 = User.create!(
  email: "goddess@gmail.com",
  password: "securepassword",
  first_name: "Diletta",
  last_name: "Leotta",
  address: "casa-mia"
)

# 3) 30 Items (5 per category)
Item.create!(name: "Wireless Noise-Cancelling Headphones",      description: "Over-ear Bluetooth headphones with ANC and 30h battery.", price: 199.99, user: seller, category: "Electronics")
Item.create!(name: "55\" Smart LED 4K TV",                      description: "Ultra HD smart TV with built-in streaming apps.",         price: 449.50, user: seller, category: "Electronics")
Item.create!(name: "Portable Bluetooth Speaker",                description: "Waterproof, 12h play time, speakerphone.",                price: 59.99,  user: seller, category: "Electronics")
Item.create!(name: "128GB USB-C Flash Drive",                   description: "High-speed USB 3.1 Type-C thumb drive.",                  price: 24.95,  user: seller, category: "Electronics")
Item.create!(name: "Wireless Ergonomic Mouse",                  description: "Rechargeable vertical mouse reducing wrist strain.",      price: 34.99,  user: seller, category: "Electronics")

Item.create!(name: "The Great Gatsby (Hardcover)",              description: "F. Scott Fitzgerald’s Jazz Age classic.",                price: 14.99,  user: seller, category: "Books")
Item.create!(name: "Clean Code (Paperback)",                    description: "Handbook of Agile Software Craftsmanship.",              price: 29.99,  user: seller, category: "Books")
Item.create!(name: "Harry Potter and the Sorcerer’s Stone",     description: "J.K. Rowling’s magical adventure begins.",                price: 9.99,   user: seller, category: "Books")
Item.create!(name: "Atomic Habits (Hardcover)",                 description: "Proven ways to build good habits by James Clear.",       price: 21.00,  user: seller, category: "Books")
Item.create!(name: "The Subtle Art of Not Giving a F*ck",       description: "A Counterintuitive Approach to Living a Good Life.",     price: 17.95,  user: seller, category: "Books")

Item.create!(name: "Men’s Classic Fit Jeans",                   description: "100% cotton denim, straight leg.",                       price: 39.99,  user: seller, category: "Clothing")
Item.create!(name: "Women’s V-Neck T-Shirt",                    description: "Soft ring-spun cotton tee, fitted silhouette.",           price: 19.50,  user: seller, category: "Clothing")
Item.create!(name: "Unisex Cotton Hoodie",                      description: "Pullover with kangaroo pocket and drawstring.",          price: 35.00,  user: seller, category: "Clothing")
Item.create!(name: "Genuine Leather Belt",                      description: "Men’s 1.5\" width, black or brown.",                      price: 25.00,  user: seller, category: "Clothing")
Item.create!(name: "Women’s Floral Summer Dress",               description: "Light chiffon, midi length, adjustable straps.",         price: 45.99,  user: seller, category: "Clothing")

item_1 = Item.create!(name: "12-Piece Porcelain Dinnerware Set",         description: "Service for four; dishwasher + microwave safe.",         price: 59.99,  user: seller_b, category: "Home")
Item.create!(name: "Non-Stick Frying Pan (10\")",               description: "PFOA-free skillet with stay-cool handle.",               price: 24.95,  user: seller_b, category: "Home")
Item.create!(name: "Memory Foam Contour Pillow",                description: "Ergonomic neck & shoulder support.",                      price: 29.99,  user: seller_b, category: "Home")
Item.create!(name: "8-Piece Stainless Steel Knife Set",         description: "Block + chef’s, paring, bread & steak knives.",          price: 79.99,  user: seller_b, category: "Home")
Item.create!(name: "Bamboo Cutting Board",                      description: "Reversible with juice groove.",                           price: 19.99,  user: seller_b, category: "Home")

Item.create!(name: "Eco-Friendly Yoga Mat",                     description: "6 mm thick, non-slip surface, strap included.",           price: 27.50,  user: seller_b, category: "Sports")
Item.create!(name: "Insulated Stainless Steel Water Bottle",    description: "32 oz; cold for 24 h or hot for 12 h.",                   price: 22.99,  user: seller_b, category: "Sports")
Item.create!(name: "Mountain Bike Helmet",                      description: "Lightweight, adjustable fit with vents.",                 price: 49.99,  user: seller_b, category: "Sports")
Item.create!(name: "Set of 3 Resistance Bands",                 description: "Light, medium, heavy tension workout bands.",             price: 15.99,  user: seller_b, category: "Sports")
Item.create!(name: "2-Person Camping Tent",                     description: "Water-resistant, easy setup, carry bag included.",       price: 69.99,  user: seller_b, category: "Sports")

Item.create!(name: "Rechargeable Electric Toothbrush",          description: "2-min timer, 3 modes, travel case.",                       price: 39.95,  user: seller_b, category: "Beauty")
Item.create!(name: "Facial Cleansing Brush",                    description: "Silicone bristles, waterproof, USB-C rechargeable.",      price: 24.99,  user: seller_b, category: "Beauty")
Item.create!(name: "Ionic Hair Dryer",                          description: "1875 W, 2 speed/heat settings, concentrator nozzle.",     price: 34.99,  user: seller_b, category: "Beauty")
Item.create!(name: "Organic Lip Balm Trio",                     description: "Beeswax-based; mint, strawberry, vanilla.",               price: 9.99,   user: seller_b, category: "Beauty")
Item.create!(name: "Nourishing Body Lotion (16 oz)",            description: "Shea butter & aloe vera; fast-absorbing.",                price: 12.99,  user: seller_b, category: "Beauty")

# CartItem.create!(cart: buyer_1.cart, item: Item.all[0], quantity: 1)
# CartItem.create!(cart: buyer_1.cart, item: Item.all[1], quantity: 1)
# CartItem.create!(cart: buyer_1.cart, item: Item.all[2], quantity: 1)
# CartItem.create!(cart: buyer_1.cart, item: Item.all[3], quantity: 1)
# CartItem.create!(cart: buyer_1.cart, item: Item.all[4], quantity: 1)
# CartItem.create!(cart: buyer_1.cart, item: Item.all[5], quantity: 1)

# # 4) Orders for Reviews test

# order_1 = Order.create!(user: buyer_1, status: "confirmed")
# OrderItem.create!(order: order_1, item: Item.last, quantity: 1, price: Item.last.price)

 Item.find_each do |item|
  url   = "https://image.pollinations.ai/prompt/#{item.name.parameterize}"
  puts url
  file  = URI.parse(url).open
  item.image.attach(
    io: file,
    filename: "#{item.name.parameterize}.jpg",
    content_type: "image/jpeg"
  )
  puts "added image to item #{item.id}"
end
