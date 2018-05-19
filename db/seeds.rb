# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(age: 12, name: 'Julian', gender: 'M', email: 'admin@admin.com', password:'administrator', picture:"http://bdfjade.com/data/out/142/6448580-profile-pictures.jpg")
User.create!(age: 26, name: 'David', gender: 'M', email: 'dahoyosr@unal.edu.co', password:'123456789',picture:"http://kb4images.com/images/profile-pictures/38054870-profile-pictures.jpg")
User.create!(age: 26, name: 'Maria', gender: 'F', email: 'maria@unal.edu.co', password:'123456789', picture: "https://www.fotkaplus.co.uk/wp-content/uploads/2016/04/carousel-profile-4.jpg")

