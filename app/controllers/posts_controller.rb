class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :create ]

  def index
    render json: Post.all
  end

  def create
    post = current_user.posts.create!(post_params)
    render json: post, status: :created
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
