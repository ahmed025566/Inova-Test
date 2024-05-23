class Post < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :reviewers, through: :reviews, source: :user
  def average_rating
    reviews.average(:rating).to_f
  end
end
