# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  User.create(name: Faker::LordOfTheRings.character, username: Faker::HarryPotter.character, birthday: Faker::Date.birthday(21, 65))
end

diffulty = ["easy", "very easy", "very hard", "hard", "medium", "impossible"]

100.times do
  Recipe.create(name: Faker::Food.dish, difficult_level: diffulty.sample, cost: 10+rand(60))
end

years = [1950..2018]
# grapes = ["Malbec", "Cabernet Sauvignon", "Pinot Noir", "Pinot Grigio", "Chardonnay", "Reisling", "Sirah", "Merlot", "Chianti", "Viognion"]
countries = ["USA", "France", "Spain", "Switzerland", "Germany", "New Zealand", "South Africa", "Argentina", "Chile", "Canada"]
wine = ["CADE", "CARM", "CARO", "CG DiArie", "CLIF", "COCO", "Ca del Sarto" ,"California Square", "Haak Winery",
"Pablo Claro"]

20.times do
  Wine.create(name: wine.sample, country: countries.sample, year: years.sample,  price: 5 + rand(100))
end
