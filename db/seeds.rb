# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

6.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    name: Faker::GreekPhilosophers.name,
    photo: Faker::LoremFlickr.image,
    bio: Faker::Job.title,
    post_counter: 0
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

    3.times do 
      post = Post.order("RANDOM()").first
      Comment.create!(text: Faker::GreekPhilosophers.quote, author:user, post:)
    end

    3.times do 
      post = Post.order("RANDOM()").first
      Like.create!(author:user, post:)
    end
  end
end
