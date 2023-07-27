# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

admin = User.new(
  email: 'admin@mail.com',
  password: '123456',
  password_confirmation: '123456',
  name: 'Admin',
  photo: Faker::Avatar.image,
  bio: Faker::Job.title,
  posts_counter: 0,
  role: 'admin'
)
admin.skip_confirmation!
admin.save!

user = User.new(
  email: 'user@mail.com',
  password: '123456',
  password_confirmation: '123456',
  name: 'User',
  photo: Faker::Avatar.image,
  bio: Faker::Job.title,
  posts_counter: 0
)
user.skip_confirmation!
user.save!

6.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::GreekPhilosophers.name,
    photo: Faker::Avatar.image,
    bio: Faker::Job.title,
    posts_counter: 0
  )
end

User.all.each do |user|
  5.times do
    post = Post.create!(
      title: Faker::Quotes::Shakespeare.hamlet_quote, 
      text: Faker::Quote.mitch_hedberg ,  
      author: user,
      comments_counter: 0,
      likes_counter: 0
    )
  end

  3.times do 
    post = Post.order("RANDOM()").first
    Comment.create!(text: Faker::GreekPhilosophers.quote, user:, post:)
  end

  3.times do 
    post = Post.order("RANDOM()").first
    Like.create!(user:, post:)
  end
end