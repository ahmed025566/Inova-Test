class PostsController < ApplicationController
  def index
    @posts = Post.left_joins(:reviews)
             .group(:id)
             .order(Arel.sql('AVG(reviews.rating) DESC NULLS LAST'))
             .paginate(page: params[:page], per_page: 10)

render json: { posts: @posts }
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      render json: { post: @post }
    else
      render json: {note: "post hasn't been created successfully"}
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
