# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'seed start'

if User.count.zero?
  admin = User.create(email: 'admin@admin.com', password: '123456')
  admin.build_user_detail(name: 'admin')
  admin.save
  admin.admin!

  user = User.create(email: 'user@example.com', password: '123456')
  user.build_user_detail(name: 'user')
  user.save
end

p 'seed done'
