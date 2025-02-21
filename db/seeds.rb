
OrderItem.delete_all
Order.delete_all
User.delete_all
Product.delete_all

users = User.create([
  { email: 'alice@example.com', password: 'password123', password_confirmation: 'password123' },
  { email: 'bob@example.com', password: 'password123', password_confirmation: 'password123' },
  { email: 'charlie@example.com', password: 'password123', password_confirmation: 'password123' }
])

products = Product.create([
  { name: 'T-shirt Running', description: 'Un t-shirt léger pour courir', price: 19.99, stock: 100 },
  { name: 'Casquette de sport', description: 'Casquette légère et respirante', price: 15.99, stock: 50 },
  { name: 'Chaussures de course', description: 'Chaussures adaptées pour les longues distances', price: 89.99, stock: 30 }
])

users.each do |user|
  order = Order.create(user: user)

  OrderItem.create([
    { order: order, product: products.sample, quantity: rand(1..3) },
    { order: order, product: products.sample, quantity: rand(1..3) }
  ])
end
