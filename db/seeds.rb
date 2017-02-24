# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

my_title = "What do you want?"
my_body = "There is a huge discrepancy with regards about what people want in general. This is unknown and should always be taken with a grain of salt."

Post.create_with(body: my_body).find_or_create_by!(title: my_title)

# Create Posts
50.times do
  # #1
  Post.create!(
      # #2
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments
# #3
100.times do
  Comment.create!(
      # #4
      post: posts.sample,
      body: RandomData.random_paragraph
  )
end


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"