# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTableGossipTag.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
Like.destroy_all

10.times do
	City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	email = Faker::Internet.email(name: "#{first_name} #{last_name}", separators: '.')
	description = Faker::TvShows::SouthPark.quote
	User.create(first_name: first_name, last_name: last_name, email: email, city: City.all.sample, age: rand(14..80), description: description, password: Faker::TvShows::SouthPark.quote)
end

User.create(first_name: "John", last_name: "Doe", email: "john.doe@thp.fr", city: City.all.sample, age: rand(14..80), description: Faker::TvShows::SouthPark.quote, password: "thegossipproject")


10.times do
	Tag.create(title: Faker::Creature::Animal.name)
end

20.times do
	title = Faker::TvShows::Community.quotes[0..13]
	content = Faker::TvShows::Simpsons.quote
	user = User.all.sample
	Gossip.create(title: title, content: content, user: user)
end


Gossip.all.each do |gossip|
	JoinTableGossipTag.create(gossip: gossip, tag: Tag.all.sample)
end

20.times do
	Comment.create(content: Faker::TvShows::Stargate.quote, gossip: Gossip.all.sample, user: User.all.sample)
end

20.times do
		Like.create(user: User.all.sample, gossip: Gossip.all.sample)
end