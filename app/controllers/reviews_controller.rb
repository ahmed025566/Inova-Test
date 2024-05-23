class ReviewsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @review = @post.reviews.new(review_params)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
