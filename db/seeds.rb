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
	User.create(first_name: first_name, last_name: last_name, email: email, city: City.all.sample, age: rand(14..80), description: description)
end

20.times do
	title = Faker::TvShows::Community.quotes[0..13]
	content = Faker::TvShows::Simpsons.quote
	user = User.all.sample
	Gossip.create(title: title, content: content, user: user)
end

10.times do
	Tag.create(title: Faker::Creature::Animal.name)
end

15.times do
	JoinTableGossipTag.create(gossip: Gossip.all.sample, tag: Tag.all.sample)
end

10.times do
	PrivateMessage.create(content: Faker::TvShows::HowIMetYourMother.quote,recipient: User.all.sample,sender: User.all.sample)
end

20.times do
	if rand(0..1) == 0
		Comment.create(content: Faker::TvShows::Stargate.quote ,parent: Gossip.all.sample,user: User.all.sample)
	else
		Comment.create(content: Faker::TvShows::Stargate.quote ,parent: Comment.all.sample,user: User.all.sample)
	end
end

20.times do
	if rand(0..1) == 0
		Like.create(user: User.all.sample, gossip: Gossip.all.sample)
	else
		Like.create(user: User.all.sample, comment: Comment.all.sample)
	end
end