# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'seed start'

if User.count.zero?
  admin = User.create(email: 'admin@example.com', password: '123456')
  admin.build_user_detail(name: 'admin')
  admin.save
  admin.admin!

  user = User.create(email: 'user@example.com', password: '123456')
  user.build_user_detail(name: 'user')
  user.save
end

if Category.count.zero?
  main_categories = [
    { name: 'Elektronik' },
    { name: 'Dompet' },
    { name: 'Hewan Peliharaan' },
    { name: 'Tas' },
    { name: 'Uang' },
    { name: 'Perhiasan' },
    { name: 'Lainnya' }
  ]
  Category.create(main_categories)
end

if Item.count.zero?
  40.times do
    Item.create(
      user: User.all.sample,
      title: Faker::Lorem.sentence,
      detail: Faker::Lorem.paragraph,
      condition: Item.conditions.values.sample,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      radius: [0, 10, 20, 30].sample,
      time_start: Time.now,
      time_end: Time.now + 1.year,
      status: Item.statuses[:published]
    )
  end

  Item.all.each do |item|
    [1, 2].sample.times do
      category = Category.where.not(id: item.categories.pluck(:id)).sample
      item.category_items.create(category_id: category.id)
    end
    item.create_reward(value: [100_000, 500_000].sample) if [false, false, true].sample
  end
end

p 'seed done'
