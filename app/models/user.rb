class User < ApplicationRecord
  has_many :posts
  has_many :reviews
  has_many :reviewed_posts, through: :reviews, source: :post
end
