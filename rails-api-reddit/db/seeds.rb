# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create Users
moin = User.create(email: "moin@moin.com", username: "moin", password: "123456")

dude_123 = User.create(email: "dude@dude.com", username: "dude", password: "123456")

redditor2019 = User.create(email: "redditor@redditor.com", username: "redditor2019", password: "123456")

users = [moin, dude_123, redditor2019]

#Save each user
users.each do |user|
  user.save()
end

posts = []
comments = []


#Create 10 posts
for _ in 0..10
  post = Post.create(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ullamcorper lobortis porttitor. In vitae quam nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec maximus bibendum volutpat. Nullam ornare urna dolor, at ultrices lorem consequat in. Su", body: Faker::Lorem.paragraph(rand(10..40)), user: users[rand(0..2)])
  post.save()
  posts << post
end

#Last Post with a lot of words
post = Post.create(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ullamcorper lobortis porttitor. In vitae quam nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec maximus bibendum volutpat. Nullam ornare urna dolor, at ultrices lorem consequat in. Su", body: Faker::Lorem.paragraph(80), user: moin)
comment = Comment.create(body: "This is to test post word count", user: users[rand(0..2)], post: posts[rand(0..10)])
post.comments << comment
post.save()
comment.save()
posts << post

#Create 30 Comments
for _ in 0..100
  comment = Comment.create(body: Faker::Lorem.paragraph(rand(20..60)), user: users[rand(0..2)], post: posts[rand(0..10)])
  comment.save()
  comments << comment
end

