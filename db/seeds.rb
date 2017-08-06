require 'random_data'

 # Create Posts
50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

 # Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Post.find_or_create_by(title: "Cat In The Hat", body: "Green Eggs And Ham")
Comment.find_or_create_by(body: "Hop On Pop")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
