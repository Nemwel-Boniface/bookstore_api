# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = User.create([
  {name: "Nemwel Boniface", phone: 754135545, email: "nemwelboniface@outlook.com"}
])

Book.create!(
  title: "Book 1",
  author: "Author 1",
  publisher: "Publisher 1",
  publish_date: Date.today,
  genre: "Genre 1",
  price: 250,
  user_id: 1
)

Book.create!(
  title: "Book 2",
  author: "Author 2",
  publisher: "Publisher 2",
  publish_date: Date.today,
  genre: "Genre 2",
  price: 350,
  user_id: 1
)