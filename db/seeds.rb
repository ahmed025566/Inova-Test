require 'faker'

5_000.times do
  User.create(
    username: Faker::Name.name
  )
end

# Seed posts
50_000.times do
  Post.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    user_id: rand(1..10_000)
  )
end

# Seed reviews
posts = Post.all
posts.each do |post|
  rand(1..10).times do
    post.reviews.create(
      rating: rand(1..5),
      comment: Faker::Lorem.paragraph,
      user_id: rand(1..10_000)
    )
  end
end
