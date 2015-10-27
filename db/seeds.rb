# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Like.destroy_all
User.destroy_all
Product.destroy_all
Review.destroy_all
Category.destroy_all

users = []

users << User.create(
  name: 'Pato',
  last_name: 'Campos',
  username: 'Patocarlo',
  email: 'admin@admin.com',
  password: 'voronwe364',
  role: 0
)
users << User.create(
  name: 'Alfredo',
  last_name: 'Lobos',
  username: 'Fio',
  email: 'editor@editor.com',
  password: 'voronwe364',
  role: 1
)

category = []

category << Category.create(name: 'X-wing')
category << Category.create(name: 'Warmachine')
category << Category.create(name: 'Warhammer')
category << Category.create(name: 'Dbmm')
category << Category.create(name: 'Play Mats')
category << Category.create(name: 'Bolsos')
category << Category.create(name: 'Esponjas')
category << Category.create(name: 'Otros Juegos')
category << Category.create(name: 'Juegos de Mesa')
category << Category.create(name: 'Especiales')